FANN
====

A Julia wrapper for the Fast Artificial Neural Network C library (FANN)


Installation
------------
This package is not yet registered on METADATA, but it can be installed simply by running 

	Pkg.clone("https://github.com/gasagna/FANN.git")
	Pkg.build("FANN")

in the julia REPL.

Usage
-----
To illustrate the available functionality we start by importing the package

    using FANN


Data set
-------
Both input and output data that will be used has to be in a two dimensions array, even in the case where `n_inputs` or `n_outputs` is equal to one. For example let's generate some synthetic data

    X = rand(5, 100)
    
That is we have generate a hundred random observations of a problem with five inputs. Let's suppose there is only one output so we generate some data as

    y = 0.2*X[1, :].^2 + 0.8*X[2, :] + 0.01*randn(1, 100)

Now, we create a `DataSet` object. This does not do anything in particular, but only wraps the data that will be passed to the underlying c library. Unfortunately, a copy of the data is created in this step.
    
    dset = DataSet(X, y)
    
Datasets can be saved and loaded to/from file as 

    savedset(dset, "dataset.dat")
    dset = loaddset("dataset.dat")

Artificial Neural Network
-------------------------
Now we create a neural network, i.e. a multi-layer perceptron.

	net = ANN([5, 5, 1], [:sigmoid_symmetric, :linear]; b=0.1, errorfunc=:tanh)

The first input is an array of Ints, with the number of nodes in each of the network layers. A bias node is also present in each layer except for the last one (see FANN documentation). The second input is an array of `n_layers-1` symbols that specifies the type of activation of the nodes in each layer except for the first one, which is always linear. Available activation functions are documented in src/constants.jl. The third parameter `b` is a float that specifies the half-width of the interval around zero over which random initial values for the network weights are drawn. The last argument to `ANN` is a symbol that specifies the type of error function used for training, it can be either `:tanh` (default) or `:linear`.

The network can be trained as

    train!(net, dset, max_epochs=1000, epochs_between_reports=100, desired_error=1e-8)
    
where `epochs_between_reports` determines the frequency at which training progress is displayed. We may also want to stop the training when some `desired_error` is reached. With this call, the neural network is trained using the default RPROP algorithm, with default values of the training parameters. Other training algorithm can be used, and the training parameters can be also varied, (if one knows what is doing). Four algorithms are available, and they can be specified by using one of these functions, before the call to `train!`:

    setup_rprop!(ann::ANN; increase_factor::Float64=1.2, decrease_factor::Float64=0.5, delta_min::Float64=0.0, delta_max::Float64=50.0, delta_zero::Float64=0.1)
    setup_qprop!(ann::ANN; mu::Float64=1.75, decay::Float64=-0.0001)
    setup_bprop!(ann::ANN; batch::Bool=true, learning_rate::Float64=0.7, learning_momentum::Float64=0.0)

The first function sets up the standard RPROP algorithm, and training parameters can be varied. The second sets up the QUICKPROP algorith, while the last function sets up the standard backpropagation algorithm in batch or incremental mode, depending on the value of the boolean parameter `batch`.

Early stopping
--------------
A simple form of early stopping to avoid over-fitting has been implemented. Suppose, the training and validation datasets `tset` and `vset` are available. Then the network can be trained with

    train!(net, tset, vset; max_epochs=100, desired_error=1e-5, epochs_between_reports, minratio=0.95)
    
with the additional optional parameter `minratio` to control early stopping. Typically, when over-fitting occurs the error on the training set decreases whereas the error on the validation set increases. The ratio between the errors on the training and the validation sets is evaluated every `epochs_between_reports` and if it is smaller then `minratio` the training is halted.

Prediction
----------
When the network is trained, predictions on new inputs can be obtained as

    predict(net, X)
    
where `X` is matrix with `n_inputs x n_observations` elements.

The mean square error on new data can be obtained with 
    
    mse(net, dset)
    
but note that this mean square error might be different to that obtained with
  
    sumabs2(predict(net, X) - y)
    
since `mse` uses the internal error function, specified when the network is created.
    
Finally, networks can be saved and loaded to/from a file 

    savenet(net, "net.net")
    net = loadnet("net.net")


Note
----
A minimal amount of the FANN library has been wrapped and most of the options have been left to the default values that the c library sets. New features of this wrapper will be slowly added, as it is required.


Links
-----
See these two links for full documentation 

https://github.com/libfann/fann
http://leenissen.dk/fann/wp/
