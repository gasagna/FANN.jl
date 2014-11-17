using FANN
using Base.Test

net = ANN([1, 1, 1], [:sigmoid_symmetric, :linear], b=0.1, errorfunc=:linear)

nw = FANN.nweights(net)
@test nw == 4

FANN.weights!(net, Float64[1, 2, 3, 4])
w = FANN.weights(net)
@test w == Float64[1, 2, 3, 4]
