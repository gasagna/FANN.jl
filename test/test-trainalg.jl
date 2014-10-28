using FANN
using Base.Test

# test simple linear problem for which we know the solution
net = ANN([20, 1], [:linear], b=0.1)

X = randn(20, 5000)
y = mean(X, 1)

dset = DataSet(X, y)

# we just test these work
# ~~~~~~~~~~~~~~~~~~~~~~
#  ~~~ QUICKPROP ~~~~~
setup_qprop!(net; mu=1.7, decay=-0.00001)

# train
train!(net, dset, 
	   max_epochs=1000, 
	   epochs_between_reports=0, 
	   desired_error=1e-8)

# ~~~~~~~~~~~~~~~~~~~~~~
#  ~~~~~ RPROP ~~~~~~~~~
setup_rprop!(net; increase_factor=1.5, decrease_factor=0.9, delta_min=0.0, delta_zero=0.001, delta_max=10.0)

# train
train!(net, dset, 
	   max_epochs=1000, 
	   epochs_between_reports=0, 
	   desired_error=1e-8)

# ~~~~~~~~~~~~~~~~~~~~~~
#  ~~~~~ BATCH ~~~~~~~~~
setup_bprop!(net; batch=true, learning_rate=0.5, learning_momentum=0.1)

# train
train!(net, dset, 
	   max_epochs=1000, 
	   epochs_between_reports=0, 
	   desired_error=1e-8)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  ~~~~~ INCREMENTAL ~~~~~~~~~
setup_bprop!(net; batch=false, learning_rate=0.5, learning_momentum=0.1)

# train
train!(net, dset, 
	   max_epochs=1000, 
	   epochs_between_reports=0, 
	   desired_error=1e-8)
