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