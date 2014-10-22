using FANN

# took some inspiration from Julia NLopt package
typealias _DataSet Ptr{FANN.fann_train_data}

# Create DataSet from input data. 
# 
# Observations are organised in columns in the matrices X and y, to 
# reflect the data format required by FANN, which uses an array of 
# pointers to arrays to store the observations. Hence, we make use 
# of Julia column-major order to save a copy of the data.
# 
# Parameters
# ----------
# X : n_inp x n_obs matrix
# Y : n_out x n_obs vector
type DataSet
    data::_DataSet
    function DataSet(d::_DataSet)
        d = new(d)
        finalizer(d, destroy)
        d
    end   
    function DataSet(X::Matrix, Y::Matrix)
   		if size(X, 2) != size(Y, 2) 
   			error("sizes of X and Y do not match")
   		end
		num_input, num_data = size(X)
		num_output = size(Y, 1) 
		d = ccall((:fann_create_train_array, libfann), _DataSet,
				  (Uint32, Uint32, Ptr{fann_type}, Uint32, Ptr{fann_type}),
				  num_data,
				  num_input,
				  convert(Ptr{fann_type}, pointer(X)),
				  num_output,
				  convert(Ptr{fann_type}, pointer(Y)))
        if d == C_NULL
            error("Error in fann_create_train")
        end
        DataSet(d)
    end
end

Base.convert(::Type{_DataSet}, d::DataSet) = d.data 
Base.show(io::IO, d::DataSet) = print(io, "DataSet()")
destroy(d::DataSet) = ccall((:fann_destroy_train, libfann), Void, (_DataSet,), d)

# Save a dataset to file. Used for debugging.
function save(dset::DataSet, filename) 
	retval = ccall((:fann_save_train, libfann),
			       Cint,
			       (Ptr{fann_train_data}, Ptr{Uint8}),
			       dset, filename)
	retval != 0 && error("Error saving data")
end

