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
include("data.jl")
include("ann.jl")
include("constants.jl")

# exports
export DataSet, savedset, loaddset
export ANN, train!, predict, mse, savenet, loadnet
export setup_qprop!, setup_rprop!, setup_bprop!

end