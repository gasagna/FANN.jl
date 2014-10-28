
const NULL = 0
const FANN_ERRSTR_MAX = 128

# Skipping MacroDefinition: fann_linear_func ( v1 , r1 , v2 , r2 , sum ) ( ( ( ( ( r2 ) - ( r1 ) ) * ( ( sum ) - ( v1 ) ) ) / ( ( v2 ) - ( v1 ) ) ) + ( r1 ) )
# Skipping MacroDefinition: fann_stepwise ( v1 , v2 , v3 , v4 , v5 , v6 , r1 , r2 , r3 , r4 , r5 , r6 , min , max , sum ) ( sum < v5 ? ( sum < v3 ? ( sum < v2 ? ( sum < v1 ? min : fann_linear_func ( v1 , r1 , v2 , r2 , sum ) ) : fann_linear_func ( v2 , r2 , v3 , r3 , sum ) ) : ( sum < v4 ? fann_linear_func ( v3 , r3 , v4 , r4 , sum ) : fann_linear_func ( v4 , r4 , v5 , r5 , sum ) ) ) : ( sum < v6 ? fann_linear_func ( v5 , r5 , v6 , r6 , sum ) : max ) )
# Skipping MacroDefinition: fann_linear_derive ( steepness , value ) ( steepness )
# Skipping MacroDefinition: fann_sigmoid_real ( sum ) ( 1.0f / ( 1.0f + exp ( - 2.0f * sum ) ) )
# Skipping MacroDefinition: fann_sigmoid_derive ( steepness , value ) ( 2.0f * steepness * value * ( 1.0f - value ) )
# Skipping MacroDefinition: fann_sigmoid_symmetric_real ( sum ) ( 2.0f / ( 1.0f + exp ( - 2.0f * sum ) ) - 1.0f )
# Skipping MacroDefinition: fann_sigmoid_symmetric_derive ( steepness , value ) steepness * ( 1.0f - ( value * value ) )
# Skipping MacroDefinition: fann_gaussian_real ( sum ) ( exp ( - sum * sum ) )
# Skipping MacroDefinition: fann_gaussian_derive ( steepness , value , sum ) ( - 2.0f * sum * value * steepness * steepness )
# Skipping MacroDefinition: fann_gaussian_symmetric_real ( sum ) ( ( exp ( - sum * sum ) * 2.0f ) - 1.0f )
# Skipping MacroDefinition: fann_gaussian_symmetric_derive ( steepness , value , sum ) ( - 2.0f * sum * ( value + 1.0f ) * steepness * steepness )
# Skipping MacroDefinition: fann_elliot_real ( sum ) ( ( ( sum ) / 2.0f ) / ( 1.0f + fann_abs ( sum ) ) + 0.5f )
# Skipping MacroDefinition: fann_elliot_derive ( steepness , value , sum ) ( steepness * 1.0f / ( 2.0f * ( 1.0f + fann_abs ( sum ) ) * ( 1.0f + fann_abs ( sum ) ) ) )
# Skipping MacroDefinition: fann_elliot_symmetric_real ( sum ) ( ( sum ) / ( 1.0f + fann_abs ( sum ) ) )
# Skipping MacroDefinition: fann_elliot_symmetric_derive ( steepness , value , sum ) ( steepness * 1.0f / ( ( 1.0f + fann_abs ( sum ) ) * ( 1.0f + fann_abs ( sum ) ) ) )
# Skipping MacroDefinition: fann_sin_symmetric_real ( sum ) ( sin ( sum ) )
# Skipping MacroDefinition: fann_sin_symmetric_derive ( steepness , sum ) ( steepness * cos ( steepness * sum ) )
# Skipping MacroDefinition: fann_cos_symmetric_real ( sum ) ( cos ( sum ) )
# Skipping MacroDefinition: fann_cos_symmetric_derive ( steepness , sum ) ( steepness * - sin ( steepness * sum ) )
# Skipping MacroDefinition: fann_sin_real ( sum ) ( sin ( sum ) / 2.0f + 0.5f )
# Skipping MacroDefinition: fann_sin_derive ( steepness , sum ) ( steepness * cos ( steepness * sum ) / 2.0f )
# Skipping MacroDefinition: fann_cos_real ( sum ) ( cos ( sum ) / 2.0f + 0.5f )
# Skipping MacroDefinition: fann_cos_derive ( steepness , sum ) ( steepness * - sin ( steepness * sum ) / 2.0f )
# Skipping MacroDefinition: fann_activation_switch ( activation_function , value , result ) switch ( activation_function ) \
# { case FANN_LINEAR : result = ( fann_type ) value ; break ; case FANN_LINEAR_PIECE : result = ( fann_type ) ( ( value < 0 ) ? 0 : ( value > 1 ) ? 1 : value ) ; break ; case FANN_LINEAR_PIECE_SYMMETRIC : result = ( fann_type ) ( ( value < - 1 ) ? - 1 : ( value > 1 ) ? 1 : value ) ; break ; case FANN_SIGMOID : result = ( fann_type ) fann_sigmoid_real ( value ) ; break ; case FANN_SIGMOID_SYMMETRIC : result = ( fann_type ) fann_sigmoid_symmetric_real ( value ) ; break ; case FANN_SIGMOID_SYMMETRIC_STEPWISE : result = ( fann_type ) fann_stepwise ( - 2.64665293693542480469e+00 , - 1.47221934795379638672e+00 , - 5.49306154251098632812e-01 , 5.49306154251098632812e-01 , 1.47221934795379638672e+00 , 2.64665293693542480469e+00 , - 9.90000009536743164062e-01 , - 8.99999976158142089844e-01 , - 5.00000000000000000000e-01 , 5.00000000000000000000e-01 , 8.99999976158142089844e-01 , 9.90000009536743164062e-01 , - 1 , 1 , value ) ; break ; case FANN_SIGMOID_STEPWISE : result = ( fann_type ) fann_stepwise ( - 2.64665246009826660156e+00 , - 1.47221946716308593750e+00 , - 5.49306154251098632812e-01 , 5.49306154251098632812e-01 , 1.47221934795379638672e+00 , 2.64665293693542480469e+00 , 4.99999988824129104614e-03 , 5.00000007450580596924e-02 , 2.50000000000000000000e-01 , 7.50000000000000000000e-01 , 9.49999988079071044922e-01 , 9.95000004768371582031e-01 , 0 , 1 , value ) ; break ; case FANN_THRESHOLD : result = ( fann_type ) ( ( value < 0 ) ? 0 : 1 ) ; break ; case FANN_THRESHOLD_SYMMETRIC : result = ( fann_type ) ( ( value < 0 ) ? - 1 : 1 ) ; break ; case FANN_GAUSSIAN : result = ( fann_type ) fann_gaussian_real ( value ) ; break ; case FANN_GAUSSIAN_SYMMETRIC : result = ( fann_type ) fann_gaussian_symmetric_real ( value ) ; break ; case FANN_ELLIOT : result = ( fann_type ) fann_elliot_real ( value ) ; break ; case FANN_ELLIOT_SYMMETRIC : result = ( fann_type ) fann_elliot_symmetric_real ( value ) ; break ; case FANN_SIN_SYMMETRIC : result = ( fann_type ) fann_sin_symmetric_real ( value ) ; break ; case FANN_COS_SYMMETRIC : result = ( fann_type ) fann_cos_symmetric_real ( value ) ; break ; case FANN_SIN : result = ( fann_type ) fann_sin_real ( value ) ; break ; case FANN_COS : result = ( fann_type ) fann_cos_real ( value ) ; break ; case FANN_GAUSSIAN_STEPWISE : result = 0 ; break ; \
#}

const FANN_FIX_VERSION = "FANN_FIX_2.0"
const FANN_FLO_VERSION = "FANN_FLO_2.1"
const FANN_CONF_VERSION = FANN_FLO_VERSION

# Skipping MacroDefinition: FANN_GET ( type , name ) FANN_EXTERNAL type FANN_API fann_get_ ## name ( struct fann * ann ) \
# { return ann -> name ; \
#}
# Skipping MacroDefinition: FANN_SET ( type , name ) FANN_EXTERNAL void FANN_API fann_set_ ## name ( struct fann * ann , type value ) \
# { ann -> name = value ; \
#}
# Skipping MacroDefinition: FANN_GET_SET ( type , name ) FANN_GET ( type , name ) FANN_SET ( type , name )
# Skipping MacroDefinition: fann_max ( x , y ) ( ( ( x ) > ( y ) ) ? ( x ) : ( y ) )
# Skipping MacroDefinition: fann_min ( x , y ) ( ( ( x ) < ( y ) ) ? ( x ) : ( y ) )
# Skipping MacroDefinition: fann_safe_free ( x ) { if ( x ) { free ( x ) ; x = NULL ; } }
# Skipping MacroDefinition: fann_clip ( x , lo , hi ) ( ( ( x ) < ( lo ) ) ? ( lo ) : ( ( ( x ) > ( hi ) ) ? ( hi ) : ( x ) ) )
# Skipping MacroDefinition: fann_exp2 ( x ) exp ( 0.69314718055994530942 * ( x ) )
# Skipping MacroDefinition: fann_rand ( min_value , max_value ) ( ( ( float ) ( min_value ) ) + ( ( ( float ) ( max_value ) - ( ( float ) ( min_value ) ) ) * rand ( ) / ( RAND_MAX + 1.0f ) ) )
# Skipping MacroDefinition: fann_abs ( value ) ( ( ( value ) > 0 ) ? ( value ) : - ( value ) )
# Skipping MacroDefinition: fann_mult ( x , y ) ( x * y )
# Skipping MacroDefinition: fann_div ( x , y ) ( x / y )
# Skipping MacroDefinition: fann_random_weight ( ) ( fann_rand ( - 0.1f , 0.1f ) )
# Skipping MacroDefinition: fann_random_bias_weight ( ) ( fann_rand ( - 0.1f , 0.1f ) )

# begin enum fann_errno_enum
typealias fann_errno_enum Uint32
const FANN_E_NO_ERROR = (uint32)(0)
const FANN_E_CANT_OPEN_CONFIG_R = (uint32)(1)
const FANN_E_CANT_OPEN_CONFIG_W = (uint32)(2)
const FANN_E_WRONG_CONFIG_VERSION = (uint32)(3)
const FANN_E_CANT_READ_CONFIG = (uint32)(4)
const FANN_E_CANT_READ_NEURON = (uint32)(5)
const FANN_E_CANT_READ_CONNECTIONS = (uint32)(6)
const FANN_E_WRONG_NUM_CONNECTIONS = (uint32)(7)
const FANN_E_CANT_OPEN_TD_W = (uint32)(8)
const FANN_E_CANT_OPEN_TD_R = (uint32)(9)
const FANN_E_CANT_READ_TD = (uint32)(10)
const FANN_E_CANT_ALLOCATE_MEM = (uint32)(11)
const FANN_E_CANT_TRAIN_ACTIVATION = (uint32)(12)
const FANN_E_CANT_USE_ACTIVATION = (uint32)(13)
const FANN_E_TRAIN_DATA_MISMATCH = (uint32)(14)
const FANN_E_CANT_USE_TRAIN_ALG = (uint32)(15)
const FANN_E_TRAIN_DATA_SUBSET = (uint32)(16)
const FANN_E_INDEX_OUT_OF_BOUND = (uint32)(17)
const FANN_E_SCALE_NOT_PRESENT = (uint32)(18)
const FANN_E_INPUT_NO_MATCH = (uint32)(19)
const FANN_E_OUTPUT_NO_MATCH = (uint32)(20)
const FANN_E_WRONG_PARAMETERS_FOR_CREATE = (uint32)(21)
# end enum fann_errno_enum

type fann_error
    errno_f::fann_errno_enum
    error_log::Ptr{FILE}
    errstr::Ptr{Uint8}
end

# begin enum fann_train_enum
typealias fann_train_enum Uint32
const FANN_TRAIN_INCREMENTAL = (uint32)(0)
const FANN_TRAIN_BATCH = (uint32)(1)
const FANN_TRAIN_RPROP = (uint32)(2)
const FANN_TRAIN_QUICKPROP = (uint32)(3)
const FANN_TRAIN_SARPROP = (uint32)(4)
# end enum fann_train_enum

# begin enum fann_activationfunc_enum
typealias fann_activationfunc_enum Uint32
const FANN_LINEAR = (uint32)(0)
const FANN_THRESHOLD = (uint32)(1)
const FANN_THRESHOLD_SYMMETRIC = (uint32)(2)
const FANN_SIGMOID = (uint32)(3)
const FANN_SIGMOID_STEPWISE = (uint32)(4)
const FANN_SIGMOID_SYMMETRIC = (uint32)(5)
const FANN_SIGMOID_SYMMETRIC_STEPWISE = (uint32)(6)
const FANN_GAUSSIAN = (uint32)(7)
const FANN_GAUSSIAN_SYMMETRIC = (uint32)(8)
const FANN_GAUSSIAN_STEPWISE = (uint32)(9)
const FANN_ELLIOT = (uint32)(10)
const FANN_ELLIOT_SYMMETRIC = (uint32)(11)
const FANN_LINEAR_PIECE = (uint32)(12)
const FANN_LINEAR_PIECE_SYMMETRIC = (uint32)(13)
const FANN_SIN_SYMMETRIC = (uint32)(14)
const FANN_COS_SYMMETRIC = (uint32)(15)
const FANN_SIN = (uint32)(16)
const FANN_COS = (uint32)(17)
# end enum fann_activationfunc_enum

# begin enum fann_errorfunc_enum
typealias fann_errorfunc_enum Uint32
const FANN_ERRORFUNC_LINEAR = (uint32)(0)
const FANN_ERRORFUNC_TANH = (uint32)(1)
# end enum fann_errorfunc_enum

# begin enum fann_stopfunc_enum
typealias fann_stopfunc_enum Uint32
const FANN_STOPFUNC_MSE = (uint32)(0)
const FANN_STOPFUNC_BIT = (uint32)(1)
# end enum fann_stopfunc_enum

# begin enum fann_nettype_enum
typealias fann_nettype_enum Uint32
const FANN_NETTYPE_LAYER = (uint32)(0)
const FANN_NETTYPE_SHORTCUT = (uint32)(1)
# end enum fann_nettype_enum

typealias fann_type Cdouble

type fann_neuron
    first_con::Uint32
    last_con::Uint32
    sum::fann_type
    value::fann_type
    activation_steepness::fann_type
    activation_function::fann_activationfunc_enum
end

type fann_layer
    first_neuron::Ptr{fann_neuron}
    last_neuron::Ptr{fann_neuron}
end

typealias fann_callback_type Ptr{Void}

type fann
    errno_f::fann_errno_enum
    error_log::Ptr{FILE}
    errstr::Ptr{Uint8}
    learning_rate::Cfloat
    learning_momentum::Cfloat
    connection_rate::Cfloat
    network_type::fann_nettype_enum
    first_layer::Ptr{fann_layer}
    last_layer::Ptr{fann_layer}
    total_neurons::Uint32
    num_input::Uint32
    num_output::Uint32
    weights::Ptr{fann_type}
    connections::Ptr{Ptr{fann_neuron}}
    train_errors::Ptr{fann_type}
    training_algorithm::fann_train_enum
    total_connections::Uint32
    output::Ptr{fann_type}
    num_MSE::Uint32
    MSE_value::Cfloat
    num_bit_fail::Uint32
    bit_fail_limit::fann_type
    train_error_function::fann_errorfunc_enum
    train_stop_function::fann_stopfunc_enum
    callback::fann_callback_type
    user_data::Ptr{Void}
    cascade_output_change_fraction::Cfloat
    cascade_output_stagnation_epochs::Uint32
    cascade_candidate_change_fraction::Cfloat
    cascade_candidate_stagnation_epochs::Uint32
    cascade_best_candidate::Uint32
    cascade_candidate_limit::fann_type
    cascade_weight_multiplier::fann_type
    cascade_max_out_epochs::Uint32
    cascade_max_cand_epochs::Uint32
    cascade_min_out_epochs::Uint32
    cascade_min_cand_epochs::Uint32
    cascade_activation_functions::Ptr{fann_activationfunc_enum}
    cascade_activation_functions_count::Uint32
    cascade_activation_steepnesses::Ptr{fann_type}
    cascade_activation_steepnesses_count::Uint32
    cascade_num_candidate_groups::Uint32
    cascade_candidate_scores::Ptr{fann_type}
    total_neurons_allocated::Uint32
    total_connections_allocated::Uint32
    quickprop_decay::Cfloat
    quickprop_mu::Cfloat
    rprop_increase_factor::Cfloat
    rprop_decrease_factor::Cfloat
    rprop_delta_min::Cfloat
    rprop_delta_max::Cfloat
    rprop_delta_zero::Cfloat
    sarprop_weight_decay_shift::Cfloat
    sarprop_step_error_threshold_factor::Cfloat
    sarprop_step_error_shift::Cfloat
    sarprop_temperature::Cfloat
    sarprop_epoch::Uint32
    train_slopes::Ptr{fann_type}
    prev_steps::Ptr{fann_type}
    prev_train_slopes::Ptr{fann_type}
    prev_weights_deltas::Ptr{fann_type}
    scale_mean_in::Ptr{Cfloat}
    scale_deviation_in::Ptr{Cfloat}
    scale_new_min_in::Ptr{Cfloat}
    scale_factor_in::Ptr{Cfloat}
    scale_mean_out::Ptr{Cfloat}
    scale_deviation_out::Ptr{Cfloat}
    scale_new_min_out::Ptr{Cfloat}
    scale_factor_out::Ptr{Cfloat}
end


type fann_train_data
    errno_f::fann_errno_enum
    error_log::Ptr{FILE}
    errstr::Ptr{Uint8}
    num_data::Uint32
    num_input::Uint32
    num_output::Uint32
    input::Ptr{Ptr{fann_type}}
    output::Ptr{Ptr{fann_type}}
end

type fann_connection
    from_neuron::Uint32
    to_neuron::Uint32
    weight::fann_type
end

const FANNPRINTF = "%.20e"
const FANNSCANF = "%le"
