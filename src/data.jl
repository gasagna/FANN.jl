using FANN

# took some inspiration from Julia NLopt package
typealias _DataSet Ptr{FANN.fann_train_data}

# Create DataSet from input data. 
# 
# Observations are organised in columns in the matrix X, to reflect
# the data format required by FANN, which uses an array of pointers
# to arrays to store the observations. Hence, we make use of Julia
# column-major order to save a copy of the data.
# 
# Parameters
# ----------
# X : n_feat x n_obs matrix
# y : n_obs vector
type DataSet
    data::_DataSet
    function DataSet(d::_DataSet)
        d = new(d)
        finalizer(d, destroy)
        d
    end   
    function DataSet(X::Matrix, y::Vector)
   		if size(X, 2) != length(y) 
   			error("sizes of X and y do not match")
   		end
		num_input, num_data = size(X)
		num_output = 1  
		d = ccall((:fann_create_train_array, libfann), _DataSet,
				  (Uint32, Uint32, Ptr{Cdouble}, Uint32, Ptr{Cdouble}),
				  num_data,
				  num_input,
				  convert(Ptr{Cdouble}, pointer(X)),
				  num_output,
				  convert(Ptr{Cdouble}, pointer(y)))
        if d == C_NULL
            error("Error in fann_create_train")
        end
        DataSet(d)
    end
end

Base.convert(::Type{_DataSet}, d::DataSet) = d.data 
Base.show(io::IO, d::DataSet) = print(io, "DataSet()")
destroy(d::DataSet) = ccall((:fann_destroy_train, libfann), Void, (_DataSet,), d)

function save(dset::DataSet, filename) 
	retval = ccall((:fann_save_train, libfann),
			       Cint,
			       (Ptr{fann_train_data}, Ptr{Uint8}),
			       dset, filename)
	retval != 0 && error("Error saving data")
end

