using FANN

type MLP
	ann::Ptr{FANN.fann}
end

function MLP(arch::Vector{Int})
	num_layers = uint32(length(arch))
	layers = pointer(uint32(arch))
	ann = fann_create_standard_array(num_layers, layers)
	MLP(ann)
end
