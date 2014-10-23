using FANN

typealias _ANN Ptr{FANN.fann}

type ANN
	ann::_ANN
	nin::Int
	nout::Int
	function ANN(ann::_ANN, nin::Int, nout::Int)
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
		# 
		#
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
		ANN(ann, layers[1], layers[end])
	end
end

Base.convert(::Type{_ANN}, ann::ANN) = ann.ann
destroy(ann::ANN) = ccall((:fann_destroy, libfann), Void, (_ANN,), ann)
Base.show(ann::ANN) = ccall((:fann_print_parameters, libfann), Void, (Ptr{fann},), ann)


#  ~~~~~~ Training ~~~~~~~~~
function train!(ann::ANN, dset::DataSet; 
				max_epochs::Int=100, desired_error::Float64=1e-5, epochs_between_reports::Int=10)
	# first check
	checksizes(ann, dset)
	ccall((:fann_train_on_data, libfann),
		  Void,
		  (Ptr{fann}, Ptr{fann_train_data}, Uint32, Uint32,  Cfloat),
		  ann.ann, dset, max_epochs, epochs_between_reports, desired_error)
end

function checksizes(ann::ANN, dset::DataSet)
	# Check that sizes of DataSet and ANN match
	ret = ccall((:fann_check_input_output_sizes, libfann), 
		        Cint,
		        (Ptr{fann}, Ptr{fann_train_data}),
		        ann, dset)
	ret == 0 || error("wrong DataSet or ANN sizes")
end

#  ~~~~~~ Prediction ~~~~~~~~~
function predict{T}(ann::ANN, X::Matrix{T})
	nin, nobs = size(X)
	# output vector
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
