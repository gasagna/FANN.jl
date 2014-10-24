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

Both input and output data that will be used has to be in a two dimensions array, even in the case where `n_inputs` or `n_outputs` is equal to one. For example let's generate some synthetic data

    X = rand(5, 100)
    
That is we have generate a hundred random observations of a problem with five inputs. Let's suppose there is only one output so we generate some data as

    y = 0.2*X[1, :].^2 + 0.8*X[2, :] + 0.01*randn(1, 100)

Now, we create a `DataSet` object. This does not do anything in particular, but only wraps the data that will be passed to the underlying c library. Unfortunately, a copy of the data is created in this step.
    
    dset = DataSet(X, y)
    
Datasets can be saved and loaded to/from file as 

    savedset(dset, "dataset.dat")
    dset = loaddset("dataset.dat")

Now we create a neural network, i.e. a multi-layer perceptron.

	net = ANN([5, 5, 1], [:sigmoid_symmetric, :linear], b=0.1)

First input is an array of Ints, with the number of nodes in each of the network layers. A bias node is also present in each layer except for the last one (see FANN documentation). The second input is an array of `n_layers-1` symbols that specifies the type of activation of the nodes in each layer except for the first one, which is always linear. Available activation functions are documented in src/constants.jl. The last parameter is a float that specifies the half-width of the interval around zero over which random initial values for the network weights are drawn.

The network can be trained as

    train!(net, dset, max_epochs=1000, epochs_between_reports=100, desired_error=1e-8)
    
where `epochs_between_reports` determines the frequency at which training progress is displayed. We may also want to stop the training when some `desired_error` is reached.

When the network is trained, predictions on new inputs can be obtained as

    predict(net, X)
    
where `X` is matrix with `n_inputs x n_observations` elements.

The mean square error on new data can be obtained with 
    
    mse(net, dset)
    
but note that this mean square error is different to that obtained with
  
    sumabs2(predict(net, X) - y)
    
since `mse` uses the internal tanh error function, that is default in the FANN c library.
    
Finally, networks can be saved and loaded to/from a file 

    savenet(net, "net.net")
    net = loadnet("net.net")


Note
----
A minimal amount of the FANN library has been wrapped and most of the options have been left to the default values that the c library sets. New features of this wrapper will be slowly added, as it is required.



