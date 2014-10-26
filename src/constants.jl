using FANN

# Return activation number given a symbol
const activation_dict = [:linear                     => (uint32)(0),
 						 :threshold                  => (uint32)(1),
 						 :threshold_symmetric        => (uint32)(2),
 						 :sigmoid                    => (uint32)(3),
 						 :sigmoid_stepwise           => (uint32)(4),
 						 :sigmoid_symmetric          => (uint32)(5),
 						 :sigmoid_symmetric_stepwise => (uint32)(6),
 						 :gaussian                   => (uint32)(7),
 						 :gaussian_symmetric         => (uint32)(8),
 						 :gaussian_stepwise          => (uint32)(9),
 						 :elliot                     => (uint32)(10),
 						 :elliot_symmetric           => (uint32)(11),
 						 :linear_piece               => (uint32)(12),
 						 :linear_piece_symmetric     => (uint32)(13),
 						 :sin_symmetric              => (uint32)(14),
 						 :cos_symmetric              => (uint32)(15),
 						 :sin                        => (uint32)(16),
 						 :cos                        => (uint32)(17)]

function act2uint(activation::Symbol)
	haskey(activation_dict, activation) || error("activation function $activation not available")
	return activation_dict[activation]
end
	

# choose error function
const errorfunc_dict = [ :linear => (uint32)(0),
						 :tanh   => (uint32)(1)]

function errorfunc2uint(errorfunc::Symbol)
	haskey(errorfunc_dict, errorfunc) || error("errorfunc function $errorfunc not available")
	return errorfunc_dict[errorfunc]
end


# ~~~~~~~~~ Tranining algorithms ~~~~~~~~~~~~~

# QuickProp training algorithm
function setup_qprop!(ann::ANN; mu::Float64=1.75, decay::Float64=-0.0001)
    ccall((:fann_set_training_algorithm, libfann), Void, (Ptr{fann}, fann_train_enum), ann, FANN_TRAIN_QUICKPROP)
    ccall((:fann_set_quickprop_mu,       libfann), Void, (Ptr{fann}, Cfloat), ann, mu)
    ccall((:fann_set_quickprop_decay,    libfann), Void, (Ptr{fann}, Cfloat), ann, decay)
end

# Rprop training algorithm, this is the default one
function setup_rprop!(ann::ANN; increase_factor::Float64=1.2, decrease_factor::Float64=0.5, delta_min::Float64=0.0, delta_max::Float64=50.0, delta_zero::Float64=0.1)
	ccall((:fann_set_training_algorithm, libfann), Void, (Ptr{fann}, fann_train_enum), ann, FANN_TRAIN_RPROP)
	ccall((:fann_set_rprop_increase_factor, libfann), Void, (Ptr{fann}, Cfloat), ann, increase_factor)
	ccall((:fann_set_rprop_decrease_factor, libfann), Void, (Ptr{fann}, Cfloat), ann, decrease_factor)
	ccall((:fann_set_rprop_delta_min,       libfann), Void, (Ptr{fann}, Cfloat), ann, delta_min)
	ccall((:fann_set_rprop_delta_max,       libfann), Void, (Ptr{fann}, Cfloat), ann, delta_max)
	ccall((:fann_set_rprop_delta_zero,      libfann), Void, (Ptr{fann}, Cfloat), ann, delta_zero)
end

# Standard backpropagation - batch or incremental
function setup_bprop!(ann::ANN; batch::Bool=true, learning_rate::Float64=0.7, learning_momentum::Float64=0.0)
	ccall((:fann_set_training_algorithm, libfann), Void, (Ptr{fann}, fann_train_enum), ann, batch == true ? FANN_TRAIN_BATCH : FANN_TRAIN_INCREMENTAL)
	ccall((:fann_set_learning_rate,      libfann), Void, (Ptr{fann}, Cfloat), ann, learning_rate)
	ccall((:fann_set_learning_momentum,  libfann), Void, (Ptr{fann}, Cfloat), ann, learning_momentum)
end