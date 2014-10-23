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

# Return activation number given a symbol
function act2uint(activation::Symbol)
	haskey(activation_dict, activation) || error("activation function not found")
	return activation_dict[activation]
end
	



