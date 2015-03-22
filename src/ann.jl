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
	function ANN(layers::Vector{Int}, activation::Vector{Symbol}; b::Float64=0.1, errorfunc::Symbol=:tanh, steepness::Float64=1.0)
		# Artificial Neural Network type
		# 
		# Parameters
		# ----------
		# layers : number of nodes for each layer
		# activation : array of symbols with activation function for each layer excluded the input layer
		# b : [-b, b] defines the range for random initialisation of the weights
		# errorfunc : the error function used for training
		# steepness : The value of the steepness for all layers

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
        # set activation function and steepness for each layer
        for layer = 1:length(layers)-1
            ccall((:fann_set_activation_function_layer, libfann), 
            	  Void,
            	  (Ptr{fann}, fann_activationfunc_enum, Cint), 
            	  ann, act2uint(activation[layer]), layer)
            ccall((:fann_set_activation_steepness_layer, libfann), 
       			  Void, 
       			  (Ptr{fann}, fann_type, Cint),
       			  ann, steepness, layer)
        end
        # randomize weights
       	ccall((:fann_randomize_weights, libfann),
       		  Void,
       		  (Ptr{fann}, fann_type, fann_type),
       		  ann, -b, b)
       	# set train error function
       	ccall((:fann_set_train_error_function, libfann), 
       		  Void, 
       		  (Ptr{fann}, fann_errorfunc_enum),
       		  ann, errorfunc2uint(errorfunc))
		ANN(ann)
	end
end

Base.convert(::Type{_ANN}, ann::ANN) = ann.ann
destroy(ann::ANN) = ccall((:fann_destroy, libfann), Void, (_ANN,), ann)
Base.show(ann::ANN) = ccall((:fann_print_parameters, libfann), Void, (Ptr{fann},), ann)


# ~~~~~~ IO functions ~~~~~~~~
savenet(ann::ANN, file::ASCIIString) = ccall((:fann_save, libfann), Cint, (Ptr{fann}, Ptr{Uint8}), ann, file)
loadnet(file::ASCIIString) = ANN(ccall((:fann_create_from_file, libfann), Ptr{fann}, (Ptr{Uint8},), file))

# ~~~~~~~~~ Get/Set weights ~~~~~~~~~~~~~
nweights(ann::ANN) = int(ccall((:fann_get_total_connections, libfann), Uint32, (Ptr{fann},), ann))

function weights(ann::ANN)
	w = Array(Float64, nweights(ann))
	ccall((:fann_get_weights, libfann), Void, (Ptr{fann}, Ptr{fann_type}), ann, w)
	return w
end

function weights!(ann::ANN, weights::Vector{Float64})
	ccall((:fann_set_weights, libfann), Void, (Ptr{fann}, Ptr{fann_type}), ann, weights)
end

# ~~~~~~~~~ Tranining algorithms ~~~~~~~~~~~~~
# QuickProp training algorithm
function setup_qprop!(ann::ANN; mu::Float64=1.75, decay::Float64=-0.0001)
    ccall((:fann_set_training_algorithm, libfann), Void, (Ptr{fann}, fann_train_enum), ann, FANN_TRAIN_QUICKPROP)
    ccall((:fann_set_quickprop_mu,       libfann), Void, (Ptr{fann}, Cfloat), ann, mu)
    ccall((:fann_set_quickprop_decay,    libfann), Void, (Ptr{fann}, Cfloat), ann, decay)
end

# Rprop training algorithm, this is the default one
function setup_rprop!(ann::ANN; increase_factor::Float64=1.2, decrease_factor::Float64=0.5, delta_min::Float64=0.0, delta_max::Float64=50.0, delta_zero::Float64=0.1)
	ccall((:fann_set_training_algorithm, libfann), Void, (Ptr{fann}, fann_train_enum), ann, FANN_TRAIN_RPROP)
	ccall((:fann_set_rprop_increase_factor, libfann), Void, (Ptr{fann}, Cfloat), ann, increase_factor)
	ccall((:fann_set_rprop_decrease_factor, libfann), Void, (Ptr{fann}, Cfloat), ann, decrease_factor)
	ccall((:fann_set_rprop_delta_min,       libfann), Void, (Ptr{fann}, Cfloat), ann, delta_min)
	ccall((:fann_set_rprop_delta_max,       libfann), Void, (Ptr{fann}, Cfloat), ann, delta_max)
	ccall((:fann_set_rprop_delta_zero,      libfann), Void, (Ptr{fann}, Cfloat), ann, delta_zero)
end

# Standard backpropagation - batch or incremental
function setup_bprop!(ann::ANN; batch::Bool=true, learning_rate::Float64=0.7, learning_momentum::Float64=0.0)
	ccall((:fann_set_training_algorithm, libfann), Void, (Ptr{fann}, fann_train_enum), ann, batch == true ? FANN_TRAIN_BATCH : FANN_TRAIN_INCREMENTAL)
	ccall((:fann_set_learning_rate,      libfann), Void, (Ptr{fann}, Cfloat), ann, learning_rate)
	ccall((:fann_set_learning_momentum,  libfann), Void, (Ptr{fann}, Cfloat), ann, learning_momentum)
end

# Standard training function
function train!(ann::ANN, dset::DataSet; max_epochs::Int=100, desired_error::Float64=1e-5, epochs_between_reports::Int=10)
	# first check size
	checksizes(ann, dset)
	# verbosity
	isverbose = epochs_between_reports > 0
	# specify number of epoch in each iteration between reports
	epochs_between_reports < 0 && error("epochs_between_reports cannot be less than 0")
	nepochs = epochs_between_reports == 0 ? max_epochs : epochs_between_reports
	# debug header only if verbose 
	isverbose && printprog(0 , mse(ann, dset))
	# init training epochs
	epoch = 0
	while true
		# train for nepochs
		ccall((:fann_train_on_data, libfann),
		  	  Void,
		  	  (Ptr{fann}, Ptr{fann_train_data}, Uint32, Uint32,  Cfloat),
		  	  ann, dset, nepochs, 0, desired_error)
		# update nepochs
		epoch += nepochs
		# get error
		tmse = mse(ann, dset)
		# print progress
		isverbose && printprog(epoch, tmse)
		# exit condition
		tmse < desired_error && break
		epoch >= max_epochs  && break
	end 
end

# Early-stop training with validation test
function train!(ann::ANN, tset::DataSet, vset::DataSet; max_epochs::Int=100, desired_error::Float64=1e-5, epochs_between_checks::Int=10, minratio::Float64=0.95)
	# check this. Otherwise what is the point of checking?
	epochs_between_checks > 0 || error("error_between_checks must be greater than one")
	# check sizes
	checksizes(ann, tset); checksizes(ann, vset)
	# run ann on validation set to have first value 
	vmse_curr, vmse_last= mse(ann, vset), 0.0f0
	# debug header
	printprog(0, mse(ann, tset), vmse_curr)
	for i = epochs_between_checks:epochs_between_checks:max_epochs
		train!(ann, tset; 
			   max_epochs=epochs_between_checks, 
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

# Print output (can be done better though)
function printprog(epoch, tmse)
	epoch == 0 && println("Epoch  Train MSE\n~~~~~~~~~~~~~~~~")
	a = @sprintf "%5d" epoch
	b = @sprintf "%.3e" tmse
	println(a, "  ", b)
end

function printprog(epoch, tmse, vmse)
	epoch == 0 && println("Epoch  Train MSE  Valid MSE  Ratio\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
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

predict{T<:FloatingPoint}(ann::ANN, X::Vector{T}) = 
	pointer_to_array(ccall((:fann_run, libfann), 
					 Ptr{fann_type},
					 (Ptr{fann}, Ptr{fann_type}),
					 ann, X), ann.nout)