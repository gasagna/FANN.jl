using FANN

type DataSet
	data::Ptr{FANN.fann_train_data}
end

function DataSet(X::Matrix, y::Vector)
	# X : nfeat x nobs matrix
	# y : nobs vector
	# checks
	size(X, 2) == length(y) || error("sizes of X and y do not match")

	num_data = length(y)   # number of examples
	num_input = size(X, 2) # number of input nodes
	num_output = size(X, 1)   # number of output nodes
	
	# create struct
	data = fann_create_train(uint32(num_data), 
			  	             uint32(num_input), 
				             uint32(num_output))

	# manually change input and output pointers: bad... 
	data.input = pointer([pointer(X, i) for i = 1:num_input:length(X)])
	data.output = pointer([pointer(y, i) for i = 1:length(y)])

	DataSet(data)
end