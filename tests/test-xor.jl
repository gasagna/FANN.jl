using FANN
using Base.Test

net = MLP([2, 2, 1], 0.2)

# xor data, in a n_features x n_observation matrix 
X = [ 
	  0.0 0.0 1.0 1.0 ;
	  0.0 1.0 0.0 1.0	
	]

# desired ouputs	
y = [1.0, 0.0, 0.0, 1.0]

# create dataset
dset = DataSet(X, y)

# train
train!(net, dset)