using FANN
using Base.Test

# test simple linear problem for which we know the solution
net = ANN([1, 1], 0.2)

X = [ 0.0 1.0 ]
y = [ 0.0 1.0 ]

dset = DataSet(X, y)

# train
train!(net, dset, 
	   max_epochs=100000, 
	   epochs_between_reports=10000, 
	   desired_error=1e-10)

predict(net, X) |> println
