using FANN
using Base.Test

net = MLP([2, 1], 0.2)

#show(net)

X = [ 
	  0.0 0.0 1.0 1.0 2.0 3.0;
	  0.0 1.0 0.0 1.0 2.0 3.0	
	]

# desired ouputs	
y = [0.0, 1.0, 1.0, 4.0, 5.0, 100.0]

dset = DataSet(X, y)

inputs = pointer_to_array(unsafe_load(dset.data).input, 6)
println(inputs)

for inp in inputs
	println(pointer_to_array(inp, 2))
end



# train
#println(mse(net))
#for i = 1:4
#	train!(net, vec(X[:, i]), [y[i]])
#	println(mse(net))
#end

#train!(net, X, y, max_epochs=20, epochs_between_reports=1)


#FAN#N.test(net, [0.0, 0.0], [0.0]) |> println
