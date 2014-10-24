using FANN
using Base.Test

# one dimensional problem with many weigths, so it will overfit
net = ANN([1, 10, 1], [:sigmoid_symmetric, :linear], b=0.1)

# N uniformly spaced point over [0, 1]
N = 10
X = reshape([0:N-1], 1, N)/(N-1)
y = X + 0.1*randn(1, N)

# define training and validation sets
srand(1)
idx = randperm(N)
tidx = idx[1:N/2]
vidx = idx[N/2+1:end]
tset = DataSet(X[:, tidx], y[:, tidx])
vset = DataSet(X[:, vidx], y[:, vidx])

# train
train!(net, tset, vset,
	   max_epochs=10000, 
	   epochs_between_reports=200,
	   desired_error=1e-8, minratio=0.95)

# how to test this behaviour? I should return a full 
# history of the training.... but it is overkill now
# but i can test it and it stops