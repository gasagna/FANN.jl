using FANN
using Base.Test


net = ANN([1, 1], [:linear])

# train on some data
X = [0.0 1.0]
Y = [0.0 1.0]
train!(net, DataSet(X, Y), max_epochs=10000, epochs_between_reports=0)

# save and load 
save(net, "net")
net2 = load("net")
rm("net")

# should be the same prediction
@test norm(predict(net, X) - predict(net2, X)) == 0.0
