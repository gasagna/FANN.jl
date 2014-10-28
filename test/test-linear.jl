using FANN
using Base.Test

# test simple linear problem for which we know the solution
net = ANN([2, 1], [:linear], b=0.1)

X = [ 0.0 1.0 0.0 ;
	  0.0 0.0 1.0 ]
y = [ 0.0 1.0 1.0 ]

dset = DataSet(X, y)

# train
train!(net, dset, 
	   max_epochs=1000, 
	   epochs_between_reports=0, 
	   desired_error=1e-8)

# there is somethign strange here, since the network stops training
# but the mean square error is not less than the desired error. Where
# is this bug from?
out = predict(net, X) 
@test sumabs2(out - y) < 100*1e-8
