using FANN
using Base.Test

# desired input 
X = [ 1.0 3.0 5.0 7.0;
	  2.0 4.0 6.0 8.0]

# desired ouputs	
Y = [0.0 1.0 1.0 0.0]

# definitions
M = size(X, 2)
nin = size(X, 1)
nout = size(Y, 1)

# create dataset
dset = DataSet(X, Y)

# 1) try to load input data from the struct
inputs = pointer_to_array(unsafe_load(dset.data).input, M)
outputs = pointer_to_array(unsafe_load(dset.data).output, M)
for i = 1:M
	@test vec(X[:, i]) == pointer_to_array(inputs[i], nin)
	@test vec(Y[:, i]) == pointer_to_array(outputs[i], nout)
end

# 2)  try to save it and the read file
save(dset, "here")
data = readdlm("here")

# first row is header data
header = data[1, :]
@test header[1] == M
@test header[2] == nin
@test header[3] == nout

# then read rest
for i = 1:M
	actual = Float64[data[2*i, 1:nin]...] # very ugly
	expected = X[:, i]
	@test norm(actual - expected) < 1e-5

	actual = Float64[data[2*i + 1, 1:nout]...] # very ugly
	expected = Y[:, i]
	@test norm(actual - expected) < 1e-5
end
