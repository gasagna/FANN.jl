using FANN

typealias _ANN Ptr{FANN.fann}

type ANN
	ann::_ANN
	function ANN(ann::_ANN)
		ann = new(ann)
		finalizer(ann, destroy)
		ann
	end
	function ANN(layers::Vector{Int}, b::Float64=0.1)
		# allocate object
		ann = ccall((:fann_create_standard_array, libfann), 
			        Ptr{fann},
			        (Uint32, Ptr{Uint32}),
			        length(layers), 
			        pointer(uint32(layers)))
		if ann == C_NULL
            error("Error in fann_create_standard_array")
        end
		ANN(ann)
	end
end

Base.convert(::Type{_ANN}, ann::ANN) = ann.ann
destroy(ann::ANN) = ccall((:fann_destroy, libfann), Void, (_ANN,), ann)
show(ann) = fann_print_parameters(ann.ann)


#  ~~~~~~ Training ~~~~~~~~~
function train!(ann::ANN, dset::DataSet; max_epochs::Int=100, desired_error::Float64=1e-5, epochs_between_reports::Int=10)
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
	# output vector
	n_feat, n_obs = size(X)
	out = zeros(T, n_obs)
	for i = 1:n_obs
		input = pointer(X, (i-1)*n_feat + 1)
		out_ptr = fann_run(ann.ann, input)
		out[i] = unsafe_load(out_ptr, 1)
	end
	return out
end
