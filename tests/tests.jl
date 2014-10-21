using FANN
using Base.Test

# desired input 
X = [ 
	  1.0 0.0 1.0 1.0;
	  1.0 1.0 0.0 1.0	
	]

# desired ouputs	
y = [1.0, 1.0, 1.0, 4.0]

dset = DataSet(X, y)

dset |> println
dset.data |> println
unsafe_load(dset.data).input |> println
pointer_to_array(unsafe_load(dset.data).input, 4) |> println
arr = pointer_to_array(unsafe_load(dset.data).input, 4)
pointer_to_array(arr[1], 2) |> println


#train!(net, X, y, max_epochs=20, epochs_between_reports=1)
