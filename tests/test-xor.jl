using FANN
using Base.Test

net = ANN([2, 2, 1], [:sigmoid, :linear])
show(net)

# xor data, in a n_features x n_observation matrix 
X = [ 1.0 1.0 0.0 0.0 ;
	  1.0 0.0 1.0 0.0 ]

# desired ouputs	
y = [1.0 0.0 0.0 1.0]

# create dataset
dset = DataSet(X, y)

# train
train!(net, dset, 
	   max_epochs=100000, 
	   epochs_between_reports=10000, 
	   desired_error=1e-10)

#predict(net, X) |> println