using FANN

type MLP
	ann::Ptr{FANN.fann}
end

function MLP(arch::Vector{Int}, b::Float64=0.1)
	num_layers = uint32(length(arch))
	layers = pointer(uint32(arch))
	ann = fann_create_standard_array(num_layers, layers)
	fann_randomize_weights(ann, -b, b)
	MLP(ann)
end

show(mlp) = fann_print_parameters(mlp.ann)

#  ~~~~~~ Training ~~~~~~~~~
function train!{T}(mlp::MLP, X::Matrix{T}, y::Vector{T}; max_epochs::Int=100, 
				desired_error::Float64=1e-5, epochs_between_reports::Int=10)

	# create dataset
	dset = DataSet(X, y)

	# Train network on dataset
	fann_train_on_data(mlp.ann, 
					   dset.data, 
					   uint32(max_epochs), 
					   uint32(epochs_between_reports), 
					   convert(Cfloat, desired_error))
end

function train!(mlp::MLP, X::Vector{Float64}, y::Vector{Float64})
	fann_train(mlp.ann, pointer(X), pointer(y))
end

function test(mlp::MLP, X::Vector{Float64}, y::Vector{Float64})
	#fann_reset_MSE(mlp.ann)
	fann_test(mlp.ann, pointer(X), pointer(y))
	fann_get_MSE(mlp.ann)
end

#  ~~~~~~ Prediction ~~~~~~~~~
function predict{T}(mlp::MLP, X::Matrix{T})
	# output vector
	n_feat, n_obs = size(X)
	out = zeros(T, n_obs)
	for i = 1:n_obs
		input = pointer(X, (i-1)*n_feat + 1)
		out_ptr = fann_run(mlp.ann, input)
		out[i] = unsafe_load(out_ptr, 1)
	end
	return out
end


mse(mlp::MLP) = fann_get_MSE(mlp.ann)
