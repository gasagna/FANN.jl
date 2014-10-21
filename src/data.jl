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
#
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
   		d = ccall((:fann_create_train, libfann), _DataSet, 
   			      (Uint32, Uint32, Uint32), 
   			      num_data, num_input, num_output)
        if d == C_NULL
            error("Error in fann_create_train")
        end
        # ==== BEGIN TRICKY BIT =======
		tmp = unsafe_load(d)
		tmp.input = pointer([pointer(X, i) for i = 1:num_input:length(X)])
		tmp.output = pointer([pointer(y, i) for i = 1:length(y)])
		# ==== END TRICKY BIT =======
        DataSet(d)
    end
end

Base.convert(::Type{_DataSet}, d::DataSet) = d.data 
Base.show(io::IO, d::DataSet) = print(io, "DataSet()")
destroy(d::DataSet) = ccall((:fann_destroy_train, libfann), Void, (_DataSet,), d)