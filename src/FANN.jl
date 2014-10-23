module FANN

# from sundials code
if isfile(joinpath(dirname(dirname(@__FILE__)),"deps","deps.jl"))
    include("../deps/deps.jl")
else
    error("Fann not properly installed. Please run Pkg.build(\"FANN\")")
end

# C FILE pointer
immutable FILE
    ptr::Ptr{Void}
end

# load library wrapper
include("libfann_common.jl")

# load files
include("constants.jl")
include("data.jl")
include("ann.jl")

# exports
export DataSet, save
export ANN, train!, predict

end