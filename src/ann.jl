using FANN

typealias _ANN Ptr{FANN.fann}

type ANN
	ann::_ANN
	nin::Int
	nout::Int
	function ANN(ann::_ANN)
		# additional constructor for when we load a net from file
		nin = ccall((:fann_get_num_input, libfann), Uint32, (Ptr{fann},),ann)
		nout = ccall((:fann_get_num_output, libfann), Uint32, (Ptr{fann},),ann)
		ann = new(ann, nin, nout)
		finalizer(ann, destroy)
		ann
	end
	function ANN(layers::Vector{Int}, activation::Vector{Symbol}; b::Float64=0.1)
		# Artificial Neural Network 
		# 
		# Parameters
		# ----------
		# layers : number of nodes for each layer
		# activation : array of symbols with activation function for each layer excluded the input
		# b : [-b, b] defines the range for random initialisation of the weights

		# activation function for hidden and output layers
		length(activation) == length(layers) - 1 || error("wrong dimension of activation function vector ")
		# allocate object
		ann = ccall((:fann_create_standard_array, libfann), 
			        Ptr{fann},
			        (Uint32, Ptr{Uint32}),
			        length(layers), 
			        pointer(uint32(layers)))
		if ann == C_NULL
            error("Error in fann_create_standard_array")
        end
        # set activation function for each layer
        for layer = 1:length(layers)-1
            ccall((:fann_set_activation_function_layer, libfann), 
            	  Void,
            	  (Ptr{fann}, fann_activationfunc_enum, Cint), 
            	  ann, act2uint(activation[layer]), layer)
        end
        # randomize weights
       	ccall((:fann_randomize_weights, libfann),
       		  Void,
       		  (Ptr{fann}, fann_type, fann_type),
       		  ann, -b, b)
		ANN(ann)
	end
end

Base.convert(::Type{_ANN}, ann::ANN) = ann.ann
destroy(ann::ANN) = ccall((:fann_destroy, libfann), Void, (_ANN,), ann)
Base.show(ann::ANN) = ccall((:fann_print_parameters, libfann), Void, (Ptr{fann},), ann)

# ~~~~~~ IO functions ~~~~~~~~
savenet(ann::ANN, file::ASCIIString) = ccall((:fann_save, libfann), Cint, (Ptr{fann}, Ptr{Uint8}), ann, file)
loadnet(file::ASCIIString) = ANN(ccall((:fann_create_from_file, libfann), Ptr{fann}, (Ptr{Uint8},), file))


# ~~~~~~ Training funcs ~~~~~~
# Standard training function
function train!(ann::ANN, dset::DataSet; max_epochs::Int=100, desired_error::Float64=1e-5, epochs_between_reports::Int=10)
	# first check
	checksizes(ann, dset)
	ccall((:fann_train_on_data, libfann),
		  Void,
		  (Ptr{fann}, Ptr{fann_train_data}, Uint32, Uint32,  Cfloat),
		  ann.ann, dset, max_epochs, epochs_between_reports, desired_error)
end

# Early-stop training with validation test
function train!(ann::ANN, tset::DataSet, vset::DataSet; max_epochs::Int=100, desired_error::Float64=1e-5, epochs_between_reports::Int=10, minratio::Float64=0.95)
	# run ann on validation set to have first value 
	vmse_last = 0.0f0
	vmse_curr = mse(ann, vset)

	# debug header
	println("Epoch  Train MSE  Valid MSE  Tr/Val MSE Ratio")
	println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	printprog(0, mse(ann, tset), vmse_curr)

	for i = epochs_between_reports:epochs_between_reports:max_epochs
		train!(ann, tset; 
			   max_epochs=epochs_between_reports, 
			   desired_error=desired_error, 
			   epochs_between_reports=0)
		# update validation error
		vmse_curr, vmse_last = mse(ann, vset), vmse_curr
		# update training error 
		tmse_curr = mse(ann, tset)
		# print progress
		printprog(i, tmse_curr, vmse_curr)
		# check converged
		tmse_curr/vmse_curr < minratio && return nothing
	end
end

# Print output
function printprog(epoch, tmse, vmse)
	a = @sprintf "%5d" epoch
	b = @sprintf "%.3e" tmse
	c = @sprintf "%.3e" vmse
	r = @sprintf "%.3f" tmse/vmse
	println(a, "  ", b, "  ", c, "  ", r)
end

# Compute mean square error on dataset
mse(ann::ANN, dset::DataSet) = ccall((:fann_test_data, libfann), Cfloat, (Ptr{fann}, Ptr{fann_train_data}), ann, dset)

# Check that sizes of DataSet and ANN match
function checksizes(ann::ANN, dset::DataSet)
	ret = ccall((:fann_check_input_output_sizes, libfann), 
		        Cint,
		        (Ptr{fann}, Ptr{fann_train_data}),
		        ann, dset)
	ret == 0 || error("wrong DataSet or ANN sizes")
end


# ~~~~~~ Prediction function ~~~~~~
# Predict output on input X
function predict{T<:FloatingPoint}(ann::ANN, X::Matrix{T})
	nin, nobs = size(X)
	out = zeros(T, ann.nout, nobs)
	for i = 1:nobs
		out_ptr = ccall((:fann_run, libfann), 
						Ptr{fann_type},
						(Ptr{fann}, Ptr{fann_type}),
						ann, pointer(X, (i-1)*nin + 1))
		out[:, i] = pointer_to_array(out_ptr, ann.nout)
	end
	return out
end
