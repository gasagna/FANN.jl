module FANN

# exports
export MLP, train!, mse

# C FILE pointer
immutable FILE
    ptr::Ptr{Void}
end

# load library wrapper
const libfann = "/usr/lib/libdoublefann.so"
include("libfann_common.jl")
include("libfann.jl")

# load files
include("mlp.jl")

end