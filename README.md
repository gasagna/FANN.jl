FANN
====

A Julia wrapper for the Fast Artificial Neural Network C library (FANN)

Installation
------------

Usage
-----
A minimal working example that illustrates the available functionality is

	# import package
    using FANN

    # Input data arranged in a matrix of n_inputs x n_observations
    X = rand(2, 100)

    # Output data arranged in a matrix of n_output x n_observations
    # Both input and output data has to be in a 2d array, even in the case
    # n_inputs or n_output is equal to one

    # This synthetic data follows a linear model y = 0.2*x1^2 + 0.8*x2 + e
    y = 0.2*X[1, :].^2 + 0.8*X[2, :] + 0.01*randn(100)

    # create a DataSet object. This does not do anything in particular, 
    # but only wraps the data that will be passed to the underlying c library
    dset = DataSet(X, y)

    # Create a network.
    # First input is an array of Ints, with the number of nodes
    # in each of the network layers. A bias node is also present 
    # in each layer except for the last one (see FANN documentation)
    # The second input is an array of n_layers-1 symbols that specify
    # the type of activation of the nodes in each layer except for the
    # first one, which is always linear. Available activation functions
    # are documented in src/constants.jl. The last parameter is a float
    # that specify the half-width of the interval around zero over which
    # random initial values for the network weights are drawn.
    net = ANN([2, 5, 1], [:sigmoid_symmetric, :linear], b=0.1)




