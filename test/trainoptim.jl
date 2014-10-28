using Optim
using FANN
using Base.Test

net = ANN([10, 1], [:linear], b=0.1, errorfunc=:linear)

X = randn(10, 100)
y = sum(X, 1)
dset = DataSet(X, y)

# initial condition
w0 = weights(net)

# objective fucntion
f(w) = (weights!(net, w); mse(net, dset))
optimize(f, w0, ftol=1e-6) |> println

weights!(net, w0)
train!(net, dset, max_epochs=1000, epochs_between_reports=0, desired_error=1e-6)
