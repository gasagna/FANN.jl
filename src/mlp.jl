using FANN

type MLP
	ann::Ptr{FANN.fann}
end

function MLP(arch::Vector{Int}, b::Float64=0.1)
	# creat object in memory
	num_layers = uint32(length(arch))
	layers = pointer(uint32(arch))
	ann = fann_create_standard_array(num_layers, layers)
	
	# initialise weights
	fann_randomize_weights(ann, -b, b)

	MLP(ann)
end

function train!(mlp::MLP, X::Vector{Float64}, y::Vector{Float64})
	fann_train(mlp.ann, pointer(X), pointer(y))
end

mse(mlp::MLP) = fann_get_MSE(mlp.ann)
