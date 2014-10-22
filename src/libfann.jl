# Julia wrapper for header: ../deps/usr/include/fann.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function fann_set_error_log(errdat::Ptr{fann_error},log_file::Ptr{FILE})
    ccall((:fann_set_error_log,libfann),Void,(Ptr{fann_error},Ptr{FILE}),errdat,log_file)
end

function fann_get_errno(errdat::Ptr{fann_error})
    ccall((:fann_get_errno,libfann),Cint,(Ptr{fann_error},),errdat)
end

function fann_reset_errno(errdat::Ptr{fann_error})
    ccall((:fann_reset_errno,libfann),Void,(Ptr{fann_error},),errdat)
end

function fann_reset_errstr(errdat::Ptr{fann_error})
    ccall((:fann_reset_errstr,libfann),Void,(Ptr{fann_error},),errdat)
end

function fann_get_errstr(errdat::Ptr{fann_error})
    ccall((:fann_get_errstr,libfann),Ptr{Uint8},(Ptr{fann_error},),errdat)
end

function fann_print_error(errdat::Ptr{fann_error})
    ccall((:fann_print_error,libfann),Void,(Ptr{fann_error},),errdat)
end

function fann_allocate_structure(num_layers::Uint32)
    ccall((:fann_allocate_structure,libfann),Ptr{fann},(Uint32,),num_layers)
end

function fann_allocate_neurons(ann::Ptr{fann})
    ccall((:fann_allocate_neurons,libfann),Void,(Ptr{fann},),ann)
end

function fann_allocate_connections(ann::Ptr{fann})
    ccall((:fann_allocate_connections,libfann),Void,(Ptr{fann},),ann)
end

function fann_save_internal(ann::Ptr{fann},configuration_file::Ptr{Uint8},save_as_fixed::Uint32)
    ccall((:fann_save_internal,libfann),Cint,(Ptr{fann},Ptr{Uint8},Uint32),ann,configuration_file,save_as_fixed)
end

function fann_save_internal_fd(ann::Ptr{fann},conf::Ptr{FILE},configuration_file::Ptr{Uint8},save_as_fixed::Uint32)
    ccall((:fann_save_internal_fd,libfann),Cint,(Ptr{fann},Ptr{FILE},Ptr{Uint8},Uint32),ann,conf,configuration_file,save_as_fixed)
end

function fann_save_train_internal(data::Ptr{fann_train_data},filename::Ptr{Uint8},save_as_fixed::Uint32,decimal_point::Uint32)
    ccall((:fann_save_train_internal,libfann),Cint,(Ptr{fann_train_data},Ptr{Uint8},Uint32,Uint32),data,filename,save_as_fixed,decimal_point)
end

function fann_save_train_internal_fd(data::Ptr{fann_train_data},file::Ptr{FILE},filename::Ptr{Uint8},save_as_fixed::Uint32,decimal_point::Uint32)
    ccall((:fann_save_train_internal_fd,libfann),Cint,(Ptr{fann_train_data},Ptr{FILE},Ptr{Uint8},Uint32,Uint32),data,file,filename,save_as_fixed,decimal_point)
end

function fann_update_stepwise(ann::Ptr{fann})
    ccall((:fann_update_stepwise,libfann),Void,(Ptr{fann},),ann)
end

function fann_init_error_data(errdat::Ptr{fann_error})
    ccall((:fann_init_error_data,libfann),Void,(Ptr{fann_error},),errdat)
end

function fann_create_from_fd(conf::Ptr{FILE},configuration_file::Ptr{Uint8})
    ccall((:fann_create_from_fd,libfann),Ptr{fann},(Ptr{FILE},Ptr{Uint8}),conf,configuration_file)
end

function fann_read_train_from_fd(file::Ptr{FILE},filename::Ptr{Uint8})
    ccall((:fann_read_train_from_fd,libfann),Ptr{fann_train_data},(Ptr{FILE},Ptr{Uint8}),file,filename)
end

function fann_compute_MSE(ann::Ptr{fann},desired_output::Ptr{fann_type})
    ccall((:fann_compute_MSE,libfann),Void,(Ptr{fann},Ptr{fann_type}),ann,desired_output)
end

function fann_update_output_weights(ann::Ptr{fann})
    ccall((:fann_update_output_weights,libfann),Void,(Ptr{fann},),ann)
end

function fann_backpropagate_MSE(ann::Ptr{fann})
    ccall((:fann_backpropagate_MSE,libfann),Void,(Ptr{fann},),ann)
end

function fann_update_weights(ann::Ptr{fann})
    ccall((:fann_update_weights,libfann),Void,(Ptr{fann},),ann)
end

function fann_update_slopes_batch(ann::Ptr{fann},layer_begin::Ptr{fann_layer},layer_end::Ptr{fann_layer})
    ccall((:fann_update_slopes_batch,libfann),Void,(Ptr{fann},Ptr{fann_layer},Ptr{fann_layer}),ann,layer_begin,layer_end)
end

function fann_update_weights_quickprop(ann::Ptr{fann},num_data::Uint32,first_weight::Uint32,past_end::Uint32)
    ccall((:fann_update_weights_quickprop,libfann),Void,(Ptr{fann},Uint32,Uint32,Uint32),ann,num_data,first_weight,past_end)
end

function fann_update_weights_batch(ann::Ptr{fann},num_data::Uint32,first_weight::Uint32,past_end::Uint32)
    ccall((:fann_update_weights_batch,libfann),Void,(Ptr{fann},Uint32,Uint32,Uint32),ann,num_data,first_weight,past_end)
end

function fann_update_weights_irpropm(ann::Ptr{fann},first_weight::Uint32,past_end::Uint32)
    ccall((:fann_update_weights_irpropm,libfann),Void,(Ptr{fann},Uint32,Uint32),ann,first_weight,past_end)
end

function fann_update_weights_sarprop(ann::Ptr{fann},epoch::Uint32,first_weight::Uint32,past_end::Uint32)
    ccall((:fann_update_weights_sarprop,libfann),Void,(Ptr{fann},Uint32,Uint32,Uint32),ann,epoch,first_weight,past_end)
end

function fann_clear_train_arrays(ann::Ptr{fann})
    ccall((:fann_clear_train_arrays,libfann),Void,(Ptr{fann},),ann)
end

function fann_activation(ann::Ptr{fann},activation_function::Uint32,steepness::fann_type,value::fann_type)
    ccall((:fann_activation,libfann),fann_type,(Ptr{fann},Uint32,fann_type,fann_type),ann,activation_function,steepness,value)
end

function fann_activation_derived(activation_function::Uint32,steepness::fann_type,value::fann_type,sum::fann_type)
    ccall((:fann_activation_derived,libfann),fann_type,(Uint32,fann_type,fann_type,fann_type),activation_function,steepness,value,sum)
end

function fann_desired_error_reached(ann::Ptr{fann},desired_error::Cfloat)
    ccall((:fann_desired_error_reached,libfann),Cint,(Ptr{fann},Cfloat),ann,desired_error)
end

function fann_train_outputs(ann::Ptr{fann},data::Ptr{fann_train_data},desired_error::Cfloat)
    ccall((:fann_train_outputs,libfann),Cint,(Ptr{fann},Ptr{fann_train_data},Cfloat),ann,data,desired_error)
end

function fann_train_outputs_epoch(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_train_outputs_epoch,libfann),Cfloat,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_train_candidates(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_train_candidates,libfann),Cint,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_train_candidates_epoch(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_train_candidates_epoch,libfann),fann_type,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_install_candidate(ann::Ptr{fann})
    ccall((:fann_install_candidate,libfann),Void,(Ptr{fann},),ann)
end

function fann_check_input_output_sizes(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_check_input_output_sizes,libfann),Cint,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_initialize_candidates(ann::Ptr{fann})
    ccall((:fann_initialize_candidates,libfann),Cint,(Ptr{fann},),ann)
end

function fann_set_shortcut_connections(ann::Ptr{fann})
    ccall((:fann_set_shortcut_connections,libfann),Void,(Ptr{fann},),ann)
end

function fann_allocate_scale(ann::Ptr{fann})
    ccall((:fann_allocate_scale,libfann),Cint,(Ptr{fann},),ann)
end

function fann_scale_data_to_range(data::Ptr{Ptr{fann_type}},num_data::Uint32,num_elem::Uint32,old_min::fann_type,old_max::fann_type,new_min::fann_type,new_max::fann_type)
    ccall((:fann_scale_data_to_range,libfann),Void,(Ptr{Ptr{fann_type}},Uint32,Uint32,fann_type,fann_type,fann_type,fann_type),data,num_data,num_elem,old_min,old_max,new_min,new_max)
end

function fann_train(ann::Ptr{fann},input::Ptr{fann_type},desired_output::Ptr{fann_type})
    ccall((:fann_train,libfann),Void,(Ptr{fann},Ptr{fann_type},Ptr{fann_type}),ann,input,desired_output)
end

function fann_test(ann::Ptr{fann},input::Ptr{fann_type},desired_output::Ptr{fann_type})
    ccall((:fann_test,libfann),Ptr{fann_type},(Ptr{fann},Ptr{fann_type},Ptr{fann_type}),ann,input,desired_output)
end

function fann_get_MSE(ann::Ptr{fann})
    ccall((:fann_get_MSE,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_get_bit_fail(ann::Ptr{fann})
    ccall((:fann_get_bit_fail,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_reset_MSE(ann::Ptr{fann})
    ccall((:fann_reset_MSE,libfann),Void,(Ptr{fann},),ann)
end

function fann_train_on_data(ann::Ptr{fann},data::Ptr{fann_train_data},max_epochs::Uint32,epochs_between_reports::Uint32,desired_error::Cfloat)
    ccall((:fann_train_on_data,libfann),Void,(Ptr{fann},Ptr{fann_train_data},Uint32,Uint32,Cfloat),ann,data,max_epochs,epochs_between_reports,desired_error)
end

function fann_train_on_file(ann::Ptr{fann},filename::Ptr{Uint8},max_epochs::Uint32,epochs_between_reports::Uint32,desired_error::Cfloat)
    ccall((:fann_train_on_file,libfann),Void,(Ptr{fann},Ptr{Uint8},Uint32,Uint32,Cfloat),ann,filename,max_epochs,epochs_between_reports,desired_error)
end

function fann_train_epoch(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_train_epoch,libfann),Cfloat,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_test_data(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_test_data,libfann),Cfloat,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_read_train_from_file(filename::Ptr{Uint8})
    ccall((:fann_read_train_from_file,libfann),Ptr{fann_train_data},(Ptr{Uint8},),filename)
end

function fann_create_train(num_data::Uint32,num_input::Uint32,num_output::Uint32)
    ccall((:fann_create_train,libfann),Ptr{fann_train_data},(Uint32,Uint32,Uint32),num_data,num_input,num_output)
end

function fann_create_train_pointer_array(num_data::Uint32,num_input::Uint32,input::Ptr{Ptr{fann_type}},num_output::Uint32,output::Ptr{Ptr{fann_type}})
    ccall((:fann_create_train_pointer_array,libfann),Ptr{fann_train_data},(Uint32,Uint32,Ptr{Ptr{fann_type}},Uint32,Ptr{Ptr{fann_type}}),num_data,num_input,input,num_output,output)
end

function fann_create_train_array(num_data::Uint32,num_input::Uint32,input::Ptr{fann_type},num_output::Uint32,output::Ptr{fann_type})
    ccall((:fann_create_train_array,libfann),Ptr{fann_train_data},(Uint32,Uint32,Ptr{fann_type},Uint32,Ptr{fann_type}),num_data,num_input,input,num_output,output)
end

function fann_create_train_from_callback(num_data::Uint32,num_input::Uint32,num_output::Uint32,user_function::Ptr{Void})
    ccall((:fann_create_train_from_callback,libfann),Ptr{fann_train_data},(Uint32,Uint32,Uint32,Ptr{Void}),num_data,num_input,num_output,user_function)
end

function fann_destroy_train(train_data::Ptr{fann_train_data})
    ccall((:fann_destroy_train,libfann),Void,(Ptr{fann_train_data},),train_data)
end

function fann_get_train_input(data::Ptr{fann_train_data},position::Uint32)
    ccall((:fann_get_train_input,libfann),Ptr{fann_type},(Ptr{fann_train_data},Uint32),data,position)
end

function fann_get_train_output(data::Ptr{fann_train_data},position::Uint32)
    ccall((:fann_get_train_output,libfann),Ptr{fann_type},(Ptr{fann_train_data},Uint32),data,position)
end

function fann_shuffle_train_data(train_data::Ptr{fann_train_data})
    ccall((:fann_shuffle_train_data,libfann),Void,(Ptr{fann_train_data},),train_data)
end

function fann_scale_train(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_scale_train,libfann),Void,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_descale_train(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_descale_train,libfann),Void,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_set_input_scaling_params(ann::Ptr{fann},data::Ptr{fann_train_data},new_input_min::Cfloat,new_input_max::Cfloat)
    ccall((:fann_set_input_scaling_params,libfann),Cint,(Ptr{fann},Ptr{fann_train_data},Cfloat,Cfloat),ann,data,new_input_min,new_input_max)
end

function fann_set_output_scaling_params(ann::Ptr{fann},data::Ptr{fann_train_data},new_output_min::Cfloat,new_output_max::Cfloat)
    ccall((:fann_set_output_scaling_params,libfann),Cint,(Ptr{fann},Ptr{fann_train_data},Cfloat,Cfloat),ann,data,new_output_min,new_output_max)
end

function fann_set_scaling_params(ann::Ptr{fann},data::Ptr{fann_train_data},new_input_min::Cfloat,new_input_max::Cfloat,new_output_min::Cfloat,new_output_max::Cfloat)
    ccall((:fann_set_scaling_params,libfann),Cint,(Ptr{fann},Ptr{fann_train_data},Cfloat,Cfloat,Cfloat,Cfloat),ann,data,new_input_min,new_input_max,new_output_min,new_output_max)
end

function fann_clear_scaling_params(ann::Ptr{fann})
    ccall((:fann_clear_scaling_params,libfann),Cint,(Ptr{fann},),ann)
end

function fann_scale_input(ann::Ptr{fann},input_vector::Ptr{fann_type})
    ccall((:fann_scale_input,libfann),Void,(Ptr{fann},Ptr{fann_type}),ann,input_vector)
end

function fann_scale_output(ann::Ptr{fann},output_vector::Ptr{fann_type})
    ccall((:fann_scale_output,libfann),Void,(Ptr{fann},Ptr{fann_type}),ann,output_vector)
end

function fann_descale_input(ann::Ptr{fann},input_vector::Ptr{fann_type})
    ccall((:fann_descale_input,libfann),Void,(Ptr{fann},Ptr{fann_type}),ann,input_vector)
end

function fann_descale_output(ann::Ptr{fann},output_vector::Ptr{fann_type})
    ccall((:fann_descale_output,libfann),Void,(Ptr{fann},Ptr{fann_type}),ann,output_vector)
end

function fann_scale_input_train_data(train_data::Ptr{fann_train_data},new_min::fann_type,new_max::fann_type)
    ccall((:fann_scale_input_train_data,libfann),Void,(Ptr{fann_train_data},fann_type,fann_type),train_data,new_min,new_max)
end

function fann_scale_output_train_data(train_data::Ptr{fann_train_data},new_min::fann_type,new_max::fann_type)
    ccall((:fann_scale_output_train_data,libfann),Void,(Ptr{fann_train_data},fann_type,fann_type),train_data,new_min,new_max)
end

function fann_scale_train_data(train_data::Ptr{fann_train_data},new_min::fann_type,new_max::fann_type)
    ccall((:fann_scale_train_data,libfann),Void,(Ptr{fann_train_data},fann_type,fann_type),train_data,new_min,new_max)
end

function fann_merge_train_data(data1::Ptr{fann_train_data},data2::Ptr{fann_train_data})
    ccall((:fann_merge_train_data,libfann),Ptr{fann_train_data},(Ptr{fann_train_data},Ptr{fann_train_data}),data1,data2)
end

function fann_duplicate_train_data(data::Ptr{fann_train_data})
    ccall((:fann_duplicate_train_data,libfann),Ptr{fann_train_data},(Ptr{fann_train_data},),data)
end

function fann_subset_train_data(data::Ptr{fann_train_data},pos::Uint32,length::Uint32)
    ccall((:fann_subset_train_data,libfann),Ptr{fann_train_data},(Ptr{fann_train_data},Uint32,Uint32),data,pos,length)
end

function fann_length_train_data(data::Ptr{fann_train_data})
    ccall((:fann_length_train_data,libfann),Uint32,(Ptr{fann_train_data},),data)
end

function fann_num_input_train_data(data::Ptr{fann_train_data})
    ccall((:fann_num_input_train_data,libfann),Uint32,(Ptr{fann_train_data},),data)
end

function fann_num_output_train_data(data::Ptr{fann_train_data})
    ccall((:fann_num_output_train_data,libfann),Uint32,(Ptr{fann_train_data},),data)
end

function fann_save_train(data::Ptr{fann_train_data},filename::Ptr{Uint8})
    ccall((:fann_save_train,libfann),Cint,(Ptr{fann_train_data},Ptr{Uint8}),data,filename)
end

function fann_save_train_to_fixed(data::Ptr{fann_train_data},filename::Ptr{Uint8},decimal_point::Uint32)
    ccall((:fann_save_train_to_fixed,libfann),Cint,(Ptr{fann_train_data},Ptr{Uint8},Uint32),data,filename,decimal_point)
end

function fann_get_training_algorithm(ann::Ptr{fann})
    ccall((:fann_get_training_algorithm,libfann),Cint,(Ptr{fann},),ann)
end

function fann_set_training_algorithm(ann::Ptr{fann},training_algorithm::fann_train_enum)
    ccall((:fann_set_training_algorithm,libfann),Void,(Ptr{fann},fann_train_enum),ann,training_algorithm)
end

function fann_get_learning_rate(ann::Ptr{fann})
    ccall((:fann_get_learning_rate,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_learning_rate(ann::Ptr{fann},learning_rate::Cfloat)
    ccall((:fann_set_learning_rate,libfann),Void,(Ptr{fann},Cfloat),ann,learning_rate)
end

function fann_get_learning_momentum(ann::Ptr{fann})
    ccall((:fann_get_learning_momentum,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_learning_momentum(ann::Ptr{fann},learning_momentum::Cfloat)
    ccall((:fann_set_learning_momentum,libfann),Void,(Ptr{fann},Cfloat),ann,learning_momentum)
end

function fann_get_activation_function(ann::Ptr{fann},layer::Cint,neuron::Cint)
    ccall((:fann_get_activation_function,libfann),Cint,(Ptr{fann},Cint,Cint),ann,layer,neuron)
end

function fann_set_activation_function(ann::Ptr{fann},activation_function::fann_activationfunc_enum,layer::Cint,neuron::Cint)
    ccall((:fann_set_activation_function,libfann),Void,(Ptr{fann},fann_activationfunc_enum,Cint,Cint),ann,activation_function,layer,neuron)
end

function fann_set_activation_function_layer(ann::Ptr{fann},activation_function::fann_activationfunc_enum,layer::Cint)
    ccall((:fann_set_activation_function_layer,libfann),Void,(Ptr{fann},fann_activationfunc_enum,Cint),ann,activation_function,layer)
end

function fann_set_activation_function_hidden(ann::Ptr{fann},activation_function::fann_activationfunc_enum)
    ccall((:fann_set_activation_function_hidden,libfann),Void,(Ptr{fann},fann_activationfunc_enum),ann,activation_function)
end

function fann_set_activation_function_output(ann::Ptr{fann},activation_function::fann_activationfunc_enum)
    ccall((:fann_set_activation_function_output,libfann),Void,(Ptr{fann},fann_activationfunc_enum),ann,activation_function)
end

function fann_get_activation_steepness(ann::Ptr{fann},layer::Cint,neuron::Cint)
    ccall((:fann_get_activation_steepness,libfann),fann_type,(Ptr{fann},Cint,Cint),ann,layer,neuron)
end

function fann_set_activation_steepness(ann::Ptr{fann},steepness::fann_type,layer::Cint,neuron::Cint)
    ccall((:fann_set_activation_steepness,libfann),Void,(Ptr{fann},fann_type,Cint,Cint),ann,steepness,layer,neuron)
end

function fann_set_activation_steepness_layer(ann::Ptr{fann},steepness::fann_type,layer::Cint)
    ccall((:fann_set_activation_steepness_layer,libfann),Void,(Ptr{fann},fann_type,Cint),ann,steepness,layer)
end

function fann_set_activation_steepness_hidden(ann::Ptr{fann},steepness::fann_type)
    ccall((:fann_set_activation_steepness_hidden,libfann),Void,(Ptr{fann},fann_type),ann,steepness)
end

function fann_set_activation_steepness_output(ann::Ptr{fann},steepness::fann_type)
    ccall((:fann_set_activation_steepness_output,libfann),Void,(Ptr{fann},fann_type),ann,steepness)
end

function fann_get_train_error_function(ann::Ptr{fann})
    ccall((:fann_get_train_error_function,libfann),Cint,(Ptr{fann},),ann)
end

function fann_set_train_error_function(ann::Ptr{fann},train_error_function::fann_errorfunc_enum)
    ccall((:fann_set_train_error_function,libfann),Void,(Ptr{fann},fann_errorfunc_enum),ann,train_error_function)
end

function fann_get_train_stop_function(ann::Ptr{fann})
    ccall((:fann_get_train_stop_function,libfann),Cint,(Ptr{fann},),ann)
end

function fann_set_train_stop_function(ann::Ptr{fann},train_stop_function::fann_stopfunc_enum)
    ccall((:fann_set_train_stop_function,libfann),Void,(Ptr{fann},fann_stopfunc_enum),ann,train_stop_function)
end

function fann_get_bit_fail_limit(ann::Ptr{fann})
    ccall((:fann_get_bit_fail_limit,libfann),fann_type,(Ptr{fann},),ann)
end

function fann_set_bit_fail_limit(ann::Ptr{fann},bit_fail_limit::fann_type)
    ccall((:fann_set_bit_fail_limit,libfann),Void,(Ptr{fann},fann_type),ann,bit_fail_limit)
end

function fann_set_callback(ann::Ptr{fann},callback::fann_callback_type)
    ccall((:fann_set_callback,libfann),Void,(Ptr{fann},fann_callback_type),ann,callback)
end

function fann_get_quickprop_decay(ann::Ptr{fann})
    ccall((:fann_get_quickprop_decay,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_quickprop_decay(ann::Ptr{fann},quickprop_decay::Cfloat)
    ccall((:fann_set_quickprop_decay,libfann),Void,(Ptr{fann},Cfloat),ann,quickprop_decay)
end

function fann_get_quickprop_mu(ann::Ptr{fann})
    ccall((:fann_get_quickprop_mu,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_quickprop_mu(ann::Ptr{fann},quickprop_mu::Cfloat)
    ccall((:fann_set_quickprop_mu,libfann),Void,(Ptr{fann},Cfloat),ann,quickprop_mu)
end

function fann_get_rprop_increase_factor(ann::Ptr{fann})
    ccall((:fann_get_rprop_increase_factor,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_rprop_increase_factor(ann::Ptr{fann},rprop_increase_factor::Cfloat)
    ccall((:fann_set_rprop_increase_factor,libfann),Void,(Ptr{fann},Cfloat),ann,rprop_increase_factor)
end

function fann_get_rprop_decrease_factor(ann::Ptr{fann})
    ccall((:fann_get_rprop_decrease_factor,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_rprop_decrease_factor(ann::Ptr{fann},rprop_decrease_factor::Cfloat)
    ccall((:fann_set_rprop_decrease_factor,libfann),Void,(Ptr{fann},Cfloat),ann,rprop_decrease_factor)
end

function fann_get_rprop_delta_min(ann::Ptr{fann})
    ccall((:fann_get_rprop_delta_min,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_rprop_delta_min(ann::Ptr{fann},rprop_delta_min::Cfloat)
    ccall((:fann_set_rprop_delta_min,libfann),Void,(Ptr{fann},Cfloat),ann,rprop_delta_min)
end

function fann_get_rprop_delta_max(ann::Ptr{fann})
    ccall((:fann_get_rprop_delta_max,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_rprop_delta_max(ann::Ptr{fann},rprop_delta_max::Cfloat)
    ccall((:fann_set_rprop_delta_max,libfann),Void,(Ptr{fann},Cfloat),ann,rprop_delta_max)
end

function fann_get_rprop_delta_zero(ann::Ptr{fann})
    ccall((:fann_get_rprop_delta_zero,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_rprop_delta_zero(ann::Ptr{fann},rprop_delta_max::Cfloat)
    ccall((:fann_set_rprop_delta_zero,libfann),Void,(Ptr{fann},Cfloat),ann,rprop_delta_max)
end

function fann_get_sarprop_weight_decay_shift(ann::Ptr{fann})
    ccall((:fann_get_sarprop_weight_decay_shift,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_sarprop_weight_decay_shift(ann::Ptr{fann},sarprop_weight_decay_shift::Cfloat)
    ccall((:fann_set_sarprop_weight_decay_shift,libfann),Void,(Ptr{fann},Cfloat),ann,sarprop_weight_decay_shift)
end

function fann_get_sarprop_step_error_threshold_factor(ann::Ptr{fann})
    ccall((:fann_get_sarprop_step_error_threshold_factor,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_sarprop_step_error_threshold_factor(ann::Ptr{fann},sarprop_step_error_threshold_factor::Cfloat)
    ccall((:fann_set_sarprop_step_error_threshold_factor,libfann),Void,(Ptr{fann},Cfloat),ann,sarprop_step_error_threshold_factor)
end

function fann_get_sarprop_step_error_shift(ann::Ptr{fann})
    ccall((:fann_get_sarprop_step_error_shift,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_sarprop_step_error_shift(ann::Ptr{fann},sarprop_step_error_shift::Cfloat)
    ccall((:fann_set_sarprop_step_error_shift,libfann),Void,(Ptr{fann},Cfloat),ann,sarprop_step_error_shift)
end

function fann_get_sarprop_temperature(ann::Ptr{fann})
    ccall((:fann_get_sarprop_temperature,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_sarprop_temperature(ann::Ptr{fann},sarprop_temperature::Cfloat)
    ccall((:fann_set_sarprop_temperature,libfann),Void,(Ptr{fann},Cfloat),ann,sarprop_temperature)
end

function fann_cascadetrain_on_data(ann::Ptr{fann},data::Ptr{fann_train_data},max_neurons::Uint32,neurons_between_reports::Uint32,desired_error::Cfloat)
    ccall((:fann_cascadetrain_on_data,libfann),Void,(Ptr{fann},Ptr{fann_train_data},Uint32,Uint32,Cfloat),ann,data,max_neurons,neurons_between_reports,desired_error)
end

function fann_cascadetrain_on_file(ann::Ptr{fann},filename::Ptr{Uint8},max_neurons::Uint32,neurons_between_reports::Uint32,desired_error::Cfloat)
    ccall((:fann_cascadetrain_on_file,libfann),Void,(Ptr{fann},Ptr{Uint8},Uint32,Uint32,Cfloat),ann,filename,max_neurons,neurons_between_reports,desired_error)
end

function fann_get_cascade_output_change_fraction(ann::Ptr{fann})
    ccall((:fann_get_cascade_output_change_fraction,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_cascade_output_change_fraction(ann::Ptr{fann},cascade_output_change_fraction::Cfloat)
    ccall((:fann_set_cascade_output_change_fraction,libfann),Void,(Ptr{fann},Cfloat),ann,cascade_output_change_fraction)
end

function fann_get_cascade_output_stagnation_epochs(ann::Ptr{fann})
    ccall((:fann_get_cascade_output_stagnation_epochs,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_set_cascade_output_stagnation_epochs(ann::Ptr{fann},cascade_output_stagnation_epochs::Uint32)
    ccall((:fann_set_cascade_output_stagnation_epochs,libfann),Void,(Ptr{fann},Uint32),ann,cascade_output_stagnation_epochs)
end

function fann_get_cascade_candidate_change_fraction(ann::Ptr{fann})
    ccall((:fann_get_cascade_candidate_change_fraction,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_cascade_candidate_change_fraction(ann::Ptr{fann},cascade_candidate_change_fraction::Cfloat)
    ccall((:fann_set_cascade_candidate_change_fraction,libfann),Void,(Ptr{fann},Cfloat),ann,cascade_candidate_change_fraction)
end

function fann_get_cascade_candidate_stagnation_epochs(ann::Ptr{fann})
    ccall((:fann_get_cascade_candidate_stagnation_epochs,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_set_cascade_candidate_stagnation_epochs(ann::Ptr{fann},cascade_candidate_stagnation_epochs::Uint32)
    ccall((:fann_set_cascade_candidate_stagnation_epochs,libfann),Void,(Ptr{fann},Uint32),ann,cascade_candidate_stagnation_epochs)
end

function fann_get_cascade_weight_multiplier(ann::Ptr{fann})
    ccall((:fann_get_cascade_weight_multiplier,libfann),fann_type,(Ptr{fann},),ann)
end

function fann_set_cascade_weight_multiplier(ann::Ptr{fann},cascade_weight_multiplier::fann_type)
    ccall((:fann_set_cascade_weight_multiplier,libfann),Void,(Ptr{fann},fann_type),ann,cascade_weight_multiplier)
end

function fann_get_cascade_candidate_limit(ann::Ptr{fann})
    ccall((:fann_get_cascade_candidate_limit,libfann),fann_type,(Ptr{fann},),ann)
end

function fann_set_cascade_candidate_limit(ann::Ptr{fann},cascade_candidate_limit::fann_type)
    ccall((:fann_set_cascade_candidate_limit,libfann),Void,(Ptr{fann},fann_type),ann,cascade_candidate_limit)
end

function fann_get_cascade_max_out_epochs(ann::Ptr{fann})
    ccall((:fann_get_cascade_max_out_epochs,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_set_cascade_max_out_epochs(ann::Ptr{fann},cascade_max_out_epochs::Uint32)
    ccall((:fann_set_cascade_max_out_epochs,libfann),Void,(Ptr{fann},Uint32),ann,cascade_max_out_epochs)
end

function fann_get_cascade_min_out_epochs(ann::Ptr{fann})
    ccall((:fann_get_cascade_min_out_epochs,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_set_cascade_min_out_epochs(ann::Ptr{fann},cascade_min_out_epochs::Uint32)
    ccall((:fann_set_cascade_min_out_epochs,libfann),Void,(Ptr{fann},Uint32),ann,cascade_min_out_epochs)
end

function fann_get_cascade_max_cand_epochs(ann::Ptr{fann})
    ccall((:fann_get_cascade_max_cand_epochs,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_set_cascade_max_cand_epochs(ann::Ptr{fann},cascade_max_cand_epochs::Uint32)
    ccall((:fann_set_cascade_max_cand_epochs,libfann),Void,(Ptr{fann},Uint32),ann,cascade_max_cand_epochs)
end

function fann_get_cascade_min_cand_epochs(ann::Ptr{fann})
    ccall((:fann_get_cascade_min_cand_epochs,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_set_cascade_min_cand_epochs(ann::Ptr{fann},cascade_min_cand_epochs::Uint32)
    ccall((:fann_set_cascade_min_cand_epochs,libfann),Void,(Ptr{fann},Uint32),ann,cascade_min_cand_epochs)
end

function fann_get_cascade_num_candidates(ann::Ptr{fann})
    ccall((:fann_get_cascade_num_candidates,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_get_cascade_activation_functions_count(ann::Ptr{fann})
    ccall((:fann_get_cascade_activation_functions_count,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_get_cascade_activation_functions(ann::Ptr{fann})
    ccall((:fann_get_cascade_activation_functions,libfann),Ptr{fann_activationfunc_enum},(Ptr{fann},),ann)
end

function fann_set_cascade_activation_functions(ann::Ptr{fann},cascade_activation_functions::Ptr{fann_activationfunc_enum},cascade_activation_functions_count::Uint32)
    ccall((:fann_set_cascade_activation_functions,libfann),Void,(Ptr{fann},Ptr{fann_activationfunc_enum},Uint32),ann,cascade_activation_functions,cascade_activation_functions_count)
end

function fann_get_cascade_activation_steepnesses_count(ann::Ptr{fann})
    ccall((:fann_get_cascade_activation_steepnesses_count,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_get_cascade_activation_steepnesses(ann::Ptr{fann})
    ccall((:fann_get_cascade_activation_steepnesses,libfann),Ptr{fann_type},(Ptr{fann},),ann)
end

function fann_set_cascade_activation_steepnesses(ann::Ptr{fann},cascade_activation_steepnesses::Ptr{fann_type},cascade_activation_steepnesses_count::Uint32)
    ccall((:fann_set_cascade_activation_steepnesses,libfann),Void,(Ptr{fann},Ptr{fann_type},Uint32),ann,cascade_activation_steepnesses,cascade_activation_steepnesses_count)
end

function fann_get_cascade_num_candidate_groups(ann::Ptr{fann})
    ccall((:fann_get_cascade_num_candidate_groups,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_set_cascade_num_candidate_groups(ann::Ptr{fann},cascade_num_candidate_groups::Uint32)
    ccall((:fann_set_cascade_num_candidate_groups,libfann),Void,(Ptr{fann},Uint32),ann,cascade_num_candidate_groups)
end

function fann_create_from_file(configuration_file::Ptr{Uint8})
    ccall((:fann_create_from_file,libfann),Ptr{fann},(Ptr{Uint8},),configuration_file)
end

function fann_save(ann::Ptr{fann},configuration_file::Ptr{Uint8})
    ccall((:fann_save,libfann),Cint,(Ptr{fann},Ptr{Uint8}),ann,configuration_file)
end

function fann_save_to_fixed(ann::Ptr{fann},configuration_file::Ptr{Uint8})
    ccall((:fann_save_to_fixed,libfann),Cint,(Ptr{fann},Ptr{Uint8}),ann,configuration_file)
end

function fann_create_standard_array(num_layers::Uint32,layers::Ptr{Uint32})
    ccall((:fann_create_standard_array,libfann),Ptr{fann},(Uint32,Ptr{Uint32}),num_layers,layers)
end

function fann_create_sparse_array(connection_rate::Cfloat,num_layers::Uint32,layers::Ptr{Uint32})
    ccall((:fann_create_sparse_array,libfann),Ptr{fann},(Cfloat,Uint32,Ptr{Uint32}),connection_rate,num_layers,layers)
end

function fann_create_shortcut_array(num_layers::Uint32,layers::Ptr{Uint32})
    ccall((:fann_create_shortcut_array,libfann),Ptr{fann},(Uint32,Ptr{Uint32}),num_layers,layers)
end

function fann_destroy(ann::Ptr{fann})
    ccall((:fann_destroy,libfann),Void,(Ptr{fann},),ann)
end

function fann_copy(ann::Ptr{fann})
    ccall((:fann_copy,libfann),Ptr{fann},(Ptr{fann},),ann)
end

function fann_run(ann::Ptr{fann},input::Ptr{fann_type})
    ccall((:fann_run,libfann),Ptr{fann_type},(Ptr{fann},Ptr{fann_type}),ann,input)
end

function fann_randomize_weights(ann::Ptr{fann},min_weight::fann_type,max_weight::fann_type)
    ccall((:fann_randomize_weights,libfann),Void,(Ptr{fann},fann_type,fann_type),ann,min_weight,max_weight)
end

function fann_init_weights(ann::Ptr{fann},train_data::Ptr{fann_train_data})
    ccall((:fann_init_weights,libfann),Void,(Ptr{fann},Ptr{fann_train_data}),ann,train_data)
end

function fann_print_connections(ann::Ptr{fann})
    ccall((:fann_print_connections,libfann),Void,(Ptr{fann},),ann)
end

function fann_print_parameters(ann::Ptr{fann})
    ccall((:fann_print_parameters,libfann),Void,(Ptr{fann},),ann)
end

function fann_get_num_input(ann::Ptr{fann})
    ccall((:fann_get_num_input,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_get_num_output(ann::Ptr{fann})
    ccall((:fann_get_num_output,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_get_total_neurons(ann::Ptr{fann})
    ccall((:fann_get_total_neurons,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_get_total_connections(ann::Ptr{fann})
    ccall((:fann_get_total_connections,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_get_network_type(ann::Ptr{fann})
    ccall((:fann_get_network_type,libfann),Cint,(Ptr{fann},),ann)
end

function fann_get_connection_rate(ann::Ptr{fann})
    ccall((:fann_get_connection_rate,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_get_num_layers(ann::Ptr{fann})
    ccall((:fann_get_num_layers,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_get_layer_array(ann::Ptr{fann},layers::Ptr{Uint32})
    ccall((:fann_get_layer_array,libfann),Void,(Ptr{fann},Ptr{Uint32}),ann,layers)
end

function fann_get_bias_array(ann::Ptr{fann},bias::Ptr{Uint32})
    ccall((:fann_get_bias_array,libfann),Void,(Ptr{fann},Ptr{Uint32}),ann,bias)
end

function fann_get_connection_array(ann::Ptr{fann},connections::Ptr{fann_connection})
    ccall((:fann_get_connection_array,libfann),Void,(Ptr{fann},Ptr{fann_connection}),ann,connections)
end

function fann_set_weight_array(ann::Ptr{fann},connections::Ptr{fann_connection},num_connections::Uint32)
    ccall((:fann_set_weight_array,libfann),Void,(Ptr{fann},Ptr{fann_connection},Uint32),ann,connections,num_connections)
end

function fann_set_weight(ann::Ptr{fann},from_neuron::Uint32,to_neuron::Uint32,weight::fann_type)
    ccall((:fann_set_weight,libfann),Void,(Ptr{fann},Uint32,Uint32,fann_type),ann,from_neuron,to_neuron,weight)
end

function fann_set_user_data(ann::Ptr{fann},user_data::Ptr{Void})
    ccall((:fann_set_user_data,libfann),Void,(Ptr{fann},Ptr{Void}),ann,user_data)
end

function fann_get_user_data(ann::Ptr{fann})
    ccall((:fann_get_user_data,libfann),Ptr{Void},(Ptr{fann},),ann)
end
# Julia wrapper for header: ../deps/usr/include/fann_activation.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

# Julia wrapper for header: ../deps/usr/include/fann_cascade.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

# Julia wrapper for header: ../deps/usr/include/fann_data.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

# Julia wrapper for header: ../deps/usr/include/fann_error.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

# Julia wrapper for header: ../deps/usr/include/fann_internal.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function fann_allocate_structure(num_layers::Uint32)
    ccall((:fann_allocate_structure,libfann),Ptr{fann},(Uint32,),num_layers)
end

function fann_allocate_neurons(ann::Ptr{fann})
    ccall((:fann_allocate_neurons,libfann),Void,(Ptr{fann},),ann)
end

function fann_allocate_connections(ann::Ptr{fann})
    ccall((:fann_allocate_connections,libfann),Void,(Ptr{fann},),ann)
end

function fann_save_internal(ann::Ptr{fann},configuration_file::Ptr{Uint8},save_as_fixed::Uint32)
    ccall((:fann_save_internal,libfann),Cint,(Ptr{fann},Ptr{Uint8},Uint32),ann,configuration_file,save_as_fixed)
end

function fann_save_internal_fd(ann::Ptr{fann},conf::Ptr{FILE},configuration_file::Ptr{Uint8},save_as_fixed::Uint32)
    ccall((:fann_save_internal_fd,libfann),Cint,(Ptr{fann},Ptr{FILE},Ptr{Uint8},Uint32),ann,conf,configuration_file,save_as_fixed)
end

function fann_save_train_internal(data::Ptr{fann_train_data},filename::Ptr{Uint8},save_as_fixed::Uint32,decimal_point::Uint32)
    ccall((:fann_save_train_internal,libfann),Cint,(Ptr{fann_train_data},Ptr{Uint8},Uint32,Uint32),data,filename,save_as_fixed,decimal_point)
end

function fann_save_train_internal_fd(data::Ptr{fann_train_data},file::Ptr{FILE},filename::Ptr{Uint8},save_as_fixed::Uint32,decimal_point::Uint32)
    ccall((:fann_save_train_internal_fd,libfann),Cint,(Ptr{fann_train_data},Ptr{FILE},Ptr{Uint8},Uint32,Uint32),data,file,filename,save_as_fixed,decimal_point)
end

function fann_update_stepwise(ann::Ptr{fann})
    ccall((:fann_update_stepwise,libfann),Void,(Ptr{fann},),ann)
end

function fann_init_error_data(errdat::Ptr{fann_error})
    ccall((:fann_init_error_data,libfann),Void,(Ptr{fann_error},),errdat)
end

function fann_create_from_fd(conf::Ptr{FILE},configuration_file::Ptr{Uint8})
    ccall((:fann_create_from_fd,libfann),Ptr{fann},(Ptr{FILE},Ptr{Uint8}),conf,configuration_file)
end

function fann_read_train_from_fd(file::Ptr{FILE},filename::Ptr{Uint8})
    ccall((:fann_read_train_from_fd,libfann),Ptr{fann_train_data},(Ptr{FILE},Ptr{Uint8}),file,filename)
end

function fann_compute_MSE(ann::Ptr{fann},desired_output::Ptr{Cint})
    ccall((:fann_compute_MSE,libfann),Void,(Ptr{fann},Ptr{Cint}),ann,desired_output)
end

function fann_update_output_weights(ann::Ptr{fann})
    ccall((:fann_update_output_weights,libfann),Void,(Ptr{fann},),ann)
end

function fann_backpropagate_MSE(ann::Ptr{fann})
    ccall((:fann_backpropagate_MSE,libfann),Void,(Ptr{fann},),ann)
end

function fann_update_weights(ann::Ptr{fann})
    ccall((:fann_update_weights,libfann),Void,(Ptr{fann},),ann)
end

function fann_update_slopes_batch(ann::Ptr{fann},layer_begin::Ptr{fann_layer},layer_end::Ptr{fann_layer})
    ccall((:fann_update_slopes_batch,libfann),Void,(Ptr{fann},Ptr{fann_layer},Ptr{fann_layer}),ann,layer_begin,layer_end)
end

function fann_update_weights_quickprop(ann::Ptr{fann},num_data::Uint32,first_weight::Uint32,past_end::Uint32)
    ccall((:fann_update_weights_quickprop,libfann),Void,(Ptr{fann},Uint32,Uint32,Uint32),ann,num_data,first_weight,past_end)
end

function fann_update_weights_batch(ann::Ptr{fann},num_data::Uint32,first_weight::Uint32,past_end::Uint32)
    ccall((:fann_update_weights_batch,libfann),Void,(Ptr{fann},Uint32,Uint32,Uint32),ann,num_data,first_weight,past_end)
end

function fann_update_weights_irpropm(ann::Ptr{fann},first_weight::Uint32,past_end::Uint32)
    ccall((:fann_update_weights_irpropm,libfann),Void,(Ptr{fann},Uint32,Uint32),ann,first_weight,past_end)
end

function fann_update_weights_sarprop(ann::Ptr{fann},epoch::Uint32,first_weight::Uint32,past_end::Uint32)
    ccall((:fann_update_weights_sarprop,libfann),Void,(Ptr{fann},Uint32,Uint32,Uint32),ann,epoch,first_weight,past_end)
end

function fann_clear_train_arrays(ann::Ptr{fann})
    ccall((:fann_clear_train_arrays,libfann),Void,(Ptr{fann},),ann)
end

function fann_activation()
    ccall((:fann_activation,libfann),Cint,())
end

function fann_activation_derived()
    ccall((:fann_activation_derived,libfann),Cint,())
end

function fann_desired_error_reached(ann::Ptr{fann},desired_error::Cfloat)
    ccall((:fann_desired_error_reached,libfann),Cint,(Ptr{fann},Cfloat),ann,desired_error)
end

function fann_train_outputs(ann::Ptr{fann},data::Ptr{fann_train_data},desired_error::Cfloat)
    ccall((:fann_train_outputs,libfann),Cint,(Ptr{fann},Ptr{fann_train_data},Cfloat),ann,data,desired_error)
end

function fann_train_outputs_epoch(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_train_outputs_epoch,libfann),Cfloat,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_train_candidates(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_train_candidates,libfann),Cint,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_train_candidates_epoch()
    ccall((:fann_train_candidates_epoch,libfann),Cint,())
end

function fann_install_candidate(ann::Ptr{fann})
    ccall((:fann_install_candidate,libfann),Void,(Ptr{fann},),ann)
end

function fann_check_input_output_sizes(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_check_input_output_sizes,libfann),Cint,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_initialize_candidates(ann::Ptr{fann})
    ccall((:fann_initialize_candidates,libfann),Cint,(Ptr{fann},),ann)
end

function fann_set_shortcut_connections(ann::Ptr{fann})
    ccall((:fann_set_shortcut_connections,libfann),Void,(Ptr{fann},),ann)
end

function fann_allocate_scale(ann::Ptr{fann})
    ccall((:fann_allocate_scale,libfann),Cint,(Ptr{fann},),ann)
end
# Julia wrapper for header: ../deps/usr/include/fann_io.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

# Julia wrapper for header: ../deps/usr/include/fann_train.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

# Julia wrapper for header: ../deps/usr/include/doublefann.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function fann_set_error_log(errdat::Ptr{fann_error},log_file::Ptr{FILE})
    ccall((:fann_set_error_log,libfann),Void,(Ptr{fann_error},Ptr{FILE}),errdat,log_file)
end

function fann_get_errno(errdat::Ptr{fann_error})
    ccall((:fann_get_errno,libfann),Cint,(Ptr{fann_error},),errdat)
end

function fann_reset_errno(errdat::Ptr{fann_error})
    ccall((:fann_reset_errno,libfann),Void,(Ptr{fann_error},),errdat)
end

function fann_reset_errstr(errdat::Ptr{fann_error})
    ccall((:fann_reset_errstr,libfann),Void,(Ptr{fann_error},),errdat)
end

function fann_get_errstr(errdat::Ptr{fann_error})
    ccall((:fann_get_errstr,libfann),Ptr{Uint8},(Ptr{fann_error},),errdat)
end

function fann_print_error(errdat::Ptr{fann_error})
    ccall((:fann_print_error,libfann),Void,(Ptr{fann_error},),errdat)
end

function fann_allocate_structure(num_layers::Uint32)
    ccall((:fann_allocate_structure,libfann),Ptr{fann},(Uint32,),num_layers)
end

function fann_allocate_neurons(ann::Ptr{fann})
    ccall((:fann_allocate_neurons,libfann),Void,(Ptr{fann},),ann)
end

function fann_allocate_connections(ann::Ptr{fann})
    ccall((:fann_allocate_connections,libfann),Void,(Ptr{fann},),ann)
end

function fann_save_internal(ann::Ptr{fann},configuration_file::Ptr{Uint8},save_as_fixed::Uint32)
    ccall((:fann_save_internal,libfann),Cint,(Ptr{fann},Ptr{Uint8},Uint32),ann,configuration_file,save_as_fixed)
end

function fann_save_internal_fd(ann::Ptr{fann},conf::Ptr{FILE},configuration_file::Ptr{Uint8},save_as_fixed::Uint32)
    ccall((:fann_save_internal_fd,libfann),Cint,(Ptr{fann},Ptr{FILE},Ptr{Uint8},Uint32),ann,conf,configuration_file,save_as_fixed)
end

function fann_save_train_internal(data::Ptr{fann_train_data},filename::Ptr{Uint8},save_as_fixed::Uint32,decimal_point::Uint32)
    ccall((:fann_save_train_internal,libfann),Cint,(Ptr{fann_train_data},Ptr{Uint8},Uint32,Uint32),data,filename,save_as_fixed,decimal_point)
end

function fann_save_train_internal_fd(data::Ptr{fann_train_data},file::Ptr{FILE},filename::Ptr{Uint8},save_as_fixed::Uint32,decimal_point::Uint32)
    ccall((:fann_save_train_internal_fd,libfann),Cint,(Ptr{fann_train_data},Ptr{FILE},Ptr{Uint8},Uint32,Uint32),data,file,filename,save_as_fixed,decimal_point)
end

function fann_update_stepwise(ann::Ptr{fann})
    ccall((:fann_update_stepwise,libfann),Void,(Ptr{fann},),ann)
end

function fann_init_error_data(errdat::Ptr{fann_error})
    ccall((:fann_init_error_data,libfann),Void,(Ptr{fann_error},),errdat)
end

function fann_create_from_fd(conf::Ptr{FILE},configuration_file::Ptr{Uint8})
    ccall((:fann_create_from_fd,libfann),Ptr{fann},(Ptr{FILE},Ptr{Uint8}),conf,configuration_file)
end

function fann_read_train_from_fd(file::Ptr{FILE},filename::Ptr{Uint8})
    ccall((:fann_read_train_from_fd,libfann),Ptr{fann_train_data},(Ptr{FILE},Ptr{Uint8}),file,filename)
end

function fann_compute_MSE(ann::Ptr{fann},desired_output::Ptr{fann_type})
    ccall((:fann_compute_MSE,libfann),Void,(Ptr{fann},Ptr{fann_type}),ann,desired_output)
end

function fann_update_output_weights(ann::Ptr{fann})
    ccall((:fann_update_output_weights,libfann),Void,(Ptr{fann},),ann)
end

function fann_backpropagate_MSE(ann::Ptr{fann})
    ccall((:fann_backpropagate_MSE,libfann),Void,(Ptr{fann},),ann)
end

function fann_update_weights(ann::Ptr{fann})
    ccall((:fann_update_weights,libfann),Void,(Ptr{fann},),ann)
end

function fann_update_slopes_batch(ann::Ptr{fann},layer_begin::Ptr{fann_layer},layer_end::Ptr{fann_layer})
    ccall((:fann_update_slopes_batch,libfann),Void,(Ptr{fann},Ptr{fann_layer},Ptr{fann_layer}),ann,layer_begin,layer_end)
end

function fann_update_weights_quickprop(ann::Ptr{fann},num_data::Uint32,first_weight::Uint32,past_end::Uint32)
    ccall((:fann_update_weights_quickprop,libfann),Void,(Ptr{fann},Uint32,Uint32,Uint32),ann,num_data,first_weight,past_end)
end

function fann_update_weights_batch(ann::Ptr{fann},num_data::Uint32,first_weight::Uint32,past_end::Uint32)
    ccall((:fann_update_weights_batch,libfann),Void,(Ptr{fann},Uint32,Uint32,Uint32),ann,num_data,first_weight,past_end)
end

function fann_update_weights_irpropm(ann::Ptr{fann},first_weight::Uint32,past_end::Uint32)
    ccall((:fann_update_weights_irpropm,libfann),Void,(Ptr{fann},Uint32,Uint32),ann,first_weight,past_end)
end

function fann_update_weights_sarprop(ann::Ptr{fann},epoch::Uint32,first_weight::Uint32,past_end::Uint32)
    ccall((:fann_update_weights_sarprop,libfann),Void,(Ptr{fann},Uint32,Uint32,Uint32),ann,epoch,first_weight,past_end)
end

function fann_clear_train_arrays(ann::Ptr{fann})
    ccall((:fann_clear_train_arrays,libfann),Void,(Ptr{fann},),ann)
end

function fann_activation(ann::Ptr{fann},activation_function::Uint32,steepness::fann_type,value::fann_type)
    ccall((:fann_activation,libfann),fann_type,(Ptr{fann},Uint32,fann_type,fann_type),ann,activation_function,steepness,value)
end

function fann_activation_derived(activation_function::Uint32,steepness::fann_type,value::fann_type,sum::fann_type)
    ccall((:fann_activation_derived,libfann),fann_type,(Uint32,fann_type,fann_type,fann_type),activation_function,steepness,value,sum)
end

function fann_desired_error_reached(ann::Ptr{fann},desired_error::Cfloat)
    ccall((:fann_desired_error_reached,libfann),Cint,(Ptr{fann},Cfloat),ann,desired_error)
end

function fann_train_outputs(ann::Ptr{fann},data::Ptr{fann_train_data},desired_error::Cfloat)
    ccall((:fann_train_outputs,libfann),Cint,(Ptr{fann},Ptr{fann_train_data},Cfloat),ann,data,desired_error)
end

function fann_train_outputs_epoch(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_train_outputs_epoch,libfann),Cfloat,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_train_candidates(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_train_candidates,libfann),Cint,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_train_candidates_epoch(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_train_candidates_epoch,libfann),fann_type,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_install_candidate(ann::Ptr{fann})
    ccall((:fann_install_candidate,libfann),Void,(Ptr{fann},),ann)
end

function fann_check_input_output_sizes(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_check_input_output_sizes,libfann),Cint,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_initialize_candidates(ann::Ptr{fann})
    ccall((:fann_initialize_candidates,libfann),Cint,(Ptr{fann},),ann)
end

function fann_set_shortcut_connections(ann::Ptr{fann})
    ccall((:fann_set_shortcut_connections,libfann),Void,(Ptr{fann},),ann)
end

function fann_allocate_scale(ann::Ptr{fann})
    ccall((:fann_allocate_scale,libfann),Cint,(Ptr{fann},),ann)
end

function fann_scale_data_to_range(data::Ptr{Ptr{fann_type}},num_data::Uint32,num_elem::Uint32,old_min::fann_type,old_max::fann_type,new_min::fann_type,new_max::fann_type)
    ccall((:fann_scale_data_to_range,libfann),Void,(Ptr{Ptr{fann_type}},Uint32,Uint32,fann_type,fann_type,fann_type,fann_type),data,num_data,num_elem,old_min,old_max,new_min,new_max)
end

function fann_train(ann::Ptr{fann},input::Ptr{fann_type},desired_output::Ptr{fann_type})
    ccall((:fann_train,libfann),Void,(Ptr{fann},Ptr{fann_type},Ptr{fann_type}),ann,input,desired_output)
end

function fann_test(ann::Ptr{fann},input::Ptr{fann_type},desired_output::Ptr{fann_type})
    ccall((:fann_test,libfann),Ptr{fann_type},(Ptr{fann},Ptr{fann_type},Ptr{fann_type}),ann,input,desired_output)
end

function fann_get_MSE(ann::Ptr{fann})
    ccall((:fann_get_MSE,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_get_bit_fail(ann::Ptr{fann})
    ccall((:fann_get_bit_fail,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_reset_MSE(ann::Ptr{fann})
    ccall((:fann_reset_MSE,libfann),Void,(Ptr{fann},),ann)
end

function fann_train_on_data(ann::Ptr{fann},data::Ptr{fann_train_data},max_epochs::Uint32,epochs_between_reports::Uint32,desired_error::Cfloat)
    ccall((:fann_train_on_data,libfann),Void,(Ptr{fann},Ptr{fann_train_data},Uint32,Uint32,Cfloat),ann,data,max_epochs,epochs_between_reports,desired_error)
end

function fann_train_on_file(ann::Ptr{fann},filename::Ptr{Uint8},max_epochs::Uint32,epochs_between_reports::Uint32,desired_error::Cfloat)
    ccall((:fann_train_on_file,libfann),Void,(Ptr{fann},Ptr{Uint8},Uint32,Uint32,Cfloat),ann,filename,max_epochs,epochs_between_reports,desired_error)
end

function fann_train_epoch(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_train_epoch,libfann),Cfloat,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_test_data(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_test_data,libfann),Cfloat,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_read_train_from_file(filename::Ptr{Uint8})
    ccall((:fann_read_train_from_file,libfann),Ptr{fann_train_data},(Ptr{Uint8},),filename)
end

function fann_create_train(num_data::Uint32,num_input::Uint32,num_output::Uint32)
    ccall((:fann_create_train,libfann),Ptr{fann_train_data},(Uint32,Uint32,Uint32),num_data,num_input,num_output)
end

function fann_create_train_pointer_array(num_data::Uint32,num_input::Uint32,input::Ptr{Ptr{fann_type}},num_output::Uint32,output::Ptr{Ptr{fann_type}})
    ccall((:fann_create_train_pointer_array,libfann),Ptr{fann_train_data},(Uint32,Uint32,Ptr{Ptr{fann_type}},Uint32,Ptr{Ptr{fann_type}}),num_data,num_input,input,num_output,output)
end

function fann_create_train_array(num_data::Uint32,num_input::Uint32,input::Ptr{fann_type},num_output::Uint32,output::Ptr{fann_type})
    ccall((:fann_create_train_array,libfann),Ptr{fann_train_data},(Uint32,Uint32,Ptr{fann_type},Uint32,Ptr{fann_type}),num_data,num_input,input,num_output,output)
end

function fann_create_train_from_callback(num_data::Uint32,num_input::Uint32,num_output::Uint32,user_function::Ptr{Void})
    ccall((:fann_create_train_from_callback,libfann),Ptr{fann_train_data},(Uint32,Uint32,Uint32,Ptr{Void}),num_data,num_input,num_output,user_function)
end

function fann_destroy_train(train_data::Ptr{fann_train_data})
    ccall((:fann_destroy_train,libfann),Void,(Ptr{fann_train_data},),train_data)
end

function fann_get_train_input(data::Ptr{fann_train_data},position::Uint32)
    ccall((:fann_get_train_input,libfann),Ptr{fann_type},(Ptr{fann_train_data},Uint32),data,position)
end

function fann_get_train_output(data::Ptr{fann_train_data},position::Uint32)
    ccall((:fann_get_train_output,libfann),Ptr{fann_type},(Ptr{fann_train_data},Uint32),data,position)
end

function fann_shuffle_train_data(train_data::Ptr{fann_train_data})
    ccall((:fann_shuffle_train_data,libfann),Void,(Ptr{fann_train_data},),train_data)
end

function fann_scale_train(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_scale_train,libfann),Void,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_descale_train(ann::Ptr{fann},data::Ptr{fann_train_data})
    ccall((:fann_descale_train,libfann),Void,(Ptr{fann},Ptr{fann_train_data}),ann,data)
end

function fann_set_input_scaling_params(ann::Ptr{fann},data::Ptr{fann_train_data},new_input_min::Cfloat,new_input_max::Cfloat)
    ccall((:fann_set_input_scaling_params,libfann),Cint,(Ptr{fann},Ptr{fann_train_data},Cfloat,Cfloat),ann,data,new_input_min,new_input_max)
end

function fann_set_output_scaling_params(ann::Ptr{fann},data::Ptr{fann_train_data},new_output_min::Cfloat,new_output_max::Cfloat)
    ccall((:fann_set_output_scaling_params,libfann),Cint,(Ptr{fann},Ptr{fann_train_data},Cfloat,Cfloat),ann,data,new_output_min,new_output_max)
end

function fann_set_scaling_params(ann::Ptr{fann},data::Ptr{fann_train_data},new_input_min::Cfloat,new_input_max::Cfloat,new_output_min::Cfloat,new_output_max::Cfloat)
    ccall((:fann_set_scaling_params,libfann),Cint,(Ptr{fann},Ptr{fann_train_data},Cfloat,Cfloat,Cfloat,Cfloat),ann,data,new_input_min,new_input_max,new_output_min,new_output_max)
end

function fann_clear_scaling_params(ann::Ptr{fann})
    ccall((:fann_clear_scaling_params,libfann),Cint,(Ptr{fann},),ann)
end

function fann_scale_input(ann::Ptr{fann},input_vector::Ptr{fann_type})
    ccall((:fann_scale_input,libfann),Void,(Ptr{fann},Ptr{fann_type}),ann,input_vector)
end

function fann_scale_output(ann::Ptr{fann},output_vector::Ptr{fann_type})
    ccall((:fann_scale_output,libfann),Void,(Ptr{fann},Ptr{fann_type}),ann,output_vector)
end

function fann_descale_input(ann::Ptr{fann},input_vector::Ptr{fann_type})
    ccall((:fann_descale_input,libfann),Void,(Ptr{fann},Ptr{fann_type}),ann,input_vector)
end

function fann_descale_output(ann::Ptr{fann},output_vector::Ptr{fann_type})
    ccall((:fann_descale_output,libfann),Void,(Ptr{fann},Ptr{fann_type}),ann,output_vector)
end

function fann_scale_input_train_data(train_data::Ptr{fann_train_data},new_min::fann_type,new_max::fann_type)
    ccall((:fann_scale_input_train_data,libfann),Void,(Ptr{fann_train_data},fann_type,fann_type),train_data,new_min,new_max)
end

function fann_scale_output_train_data(train_data::Ptr{fann_train_data},new_min::fann_type,new_max::fann_type)
    ccall((:fann_scale_output_train_data,libfann),Void,(Ptr{fann_train_data},fann_type,fann_type),train_data,new_min,new_max)
end

function fann_scale_train_data(train_data::Ptr{fann_train_data},new_min::fann_type,new_max::fann_type)
    ccall((:fann_scale_train_data,libfann),Void,(Ptr{fann_train_data},fann_type,fann_type),train_data,new_min,new_max)
end

function fann_merge_train_data(data1::Ptr{fann_train_data},data2::Ptr{fann_train_data})
    ccall((:fann_merge_train_data,libfann),Ptr{fann_train_data},(Ptr{fann_train_data},Ptr{fann_train_data}),data1,data2)
end

function fann_duplicate_train_data(data::Ptr{fann_train_data})
    ccall((:fann_duplicate_train_data,libfann),Ptr{fann_train_data},(Ptr{fann_train_data},),data)
end

function fann_subset_train_data(data::Ptr{fann_train_data},pos::Uint32,length::Uint32)
    ccall((:fann_subset_train_data,libfann),Ptr{fann_train_data},(Ptr{fann_train_data},Uint32,Uint32),data,pos,length)
end

function fann_length_train_data(data::Ptr{fann_train_data})
    ccall((:fann_length_train_data,libfann),Uint32,(Ptr{fann_train_data},),data)
end

function fann_num_input_train_data(data::Ptr{fann_train_data})
    ccall((:fann_num_input_train_data,libfann),Uint32,(Ptr{fann_train_data},),data)
end

function fann_num_output_train_data(data::Ptr{fann_train_data})
    ccall((:fann_num_output_train_data,libfann),Uint32,(Ptr{fann_train_data},),data)
end

function fann_save_train(data::Ptr{fann_train_data},filename::Ptr{Uint8})
    ccall((:fann_save_train,libfann),Cint,(Ptr{fann_train_data},Ptr{Uint8}),data,filename)
end

function fann_save_train_to_fixed(data::Ptr{fann_train_data},filename::Ptr{Uint8},decimal_point::Uint32)
    ccall((:fann_save_train_to_fixed,libfann),Cint,(Ptr{fann_train_data},Ptr{Uint8},Uint32),data,filename,decimal_point)
end

function fann_get_training_algorithm(ann::Ptr{fann})
    ccall((:fann_get_training_algorithm,libfann),Cint,(Ptr{fann},),ann)
end

function fann_set_training_algorithm(ann::Ptr{fann},training_algorithm::fann_train_enum)
    ccall((:fann_set_training_algorithm,libfann),Void,(Ptr{fann},fann_train_enum),ann,training_algorithm)
end

function fann_get_learning_rate(ann::Ptr{fann})
    ccall((:fann_get_learning_rate,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_learning_rate(ann::Ptr{fann},learning_rate::Cfloat)
    ccall((:fann_set_learning_rate,libfann),Void,(Ptr{fann},Cfloat),ann,learning_rate)
end

function fann_get_learning_momentum(ann::Ptr{fann})
    ccall((:fann_get_learning_momentum,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_learning_momentum(ann::Ptr{fann},learning_momentum::Cfloat)
    ccall((:fann_set_learning_momentum,libfann),Void,(Ptr{fann},Cfloat),ann,learning_momentum)
end

function fann_get_activation_function(ann::Ptr{fann},layer::Cint,neuron::Cint)
    ccall((:fann_get_activation_function,libfann),Cint,(Ptr{fann},Cint,Cint),ann,layer,neuron)
end

function fann_set_activation_function(ann::Ptr{fann},activation_function::fann_activationfunc_enum,layer::Cint,neuron::Cint)
    ccall((:fann_set_activation_function,libfann),Void,(Ptr{fann},fann_activationfunc_enum,Cint,Cint),ann,activation_function,layer,neuron)
end

function fann_set_activation_function_layer(ann::Ptr{fann},activation_function::fann_activationfunc_enum,layer::Cint)
    ccall((:fann_set_activation_function_layer,libfann),Void,(Ptr{fann},fann_activationfunc_enum,Cint),ann,activation_function,layer)
end

function fann_set_activation_function_hidden(ann::Ptr{fann},activation_function::fann_activationfunc_enum)
    ccall((:fann_set_activation_function_hidden,libfann),Void,(Ptr{fann},fann_activationfunc_enum),ann,activation_function)
end

function fann_set_activation_function_output(ann::Ptr{fann},activation_function::fann_activationfunc_enum)
    ccall((:fann_set_activation_function_output,libfann),Void,(Ptr{fann},fann_activationfunc_enum),ann,activation_function)
end

function fann_get_activation_steepness(ann::Ptr{fann},layer::Cint,neuron::Cint)
    ccall((:fann_get_activation_steepness,libfann),fann_type,(Ptr{fann},Cint,Cint),ann,layer,neuron)
end

function fann_set_activation_steepness(ann::Ptr{fann},steepness::fann_type,layer::Cint,neuron::Cint)
    ccall((:fann_set_activation_steepness,libfann),Void,(Ptr{fann},fann_type,Cint,Cint),ann,steepness,layer,neuron)
end

function fann_set_activation_steepness_layer(ann::Ptr{fann},steepness::fann_type,layer::Cint)
    ccall((:fann_set_activation_steepness_layer,libfann),Void,(Ptr{fann},fann_type,Cint),ann,steepness,layer)
end

function fann_set_activation_steepness_hidden(ann::Ptr{fann},steepness::fann_type)
    ccall((:fann_set_activation_steepness_hidden,libfann),Void,(Ptr{fann},fann_type),ann,steepness)
end

function fann_set_activation_steepness_output(ann::Ptr{fann},steepness::fann_type)
    ccall((:fann_set_activation_steepness_output,libfann),Void,(Ptr{fann},fann_type),ann,steepness)
end

function fann_get_train_error_function(ann::Ptr{fann})
    ccall((:fann_get_train_error_function,libfann),Cint,(Ptr{fann},),ann)
end

function fann_set_train_error_function(ann::Ptr{fann},train_error_function::fann_errorfunc_enum)
    ccall((:fann_set_train_error_function,libfann),Void,(Ptr{fann},fann_errorfunc_enum),ann,train_error_function)
end

function fann_get_train_stop_function(ann::Ptr{fann})
    ccall((:fann_get_train_stop_function,libfann),Cint,(Ptr{fann},),ann)
end

function fann_set_train_stop_function(ann::Ptr{fann},train_stop_function::fann_stopfunc_enum)
    ccall((:fann_set_train_stop_function,libfann),Void,(Ptr{fann},fann_stopfunc_enum),ann,train_stop_function)
end

function fann_get_bit_fail_limit(ann::Ptr{fann})
    ccall((:fann_get_bit_fail_limit,libfann),fann_type,(Ptr{fann},),ann)
end

function fann_set_bit_fail_limit(ann::Ptr{fann},bit_fail_limit::fann_type)
    ccall((:fann_set_bit_fail_limit,libfann),Void,(Ptr{fann},fann_type),ann,bit_fail_limit)
end

function fann_set_callback(ann::Ptr{fann},callback::fann_callback_type)
    ccall((:fann_set_callback,libfann),Void,(Ptr{fann},fann_callback_type),ann,callback)
end

function fann_get_quickprop_decay(ann::Ptr{fann})
    ccall((:fann_get_quickprop_decay,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_quickprop_decay(ann::Ptr{fann},quickprop_decay::Cfloat)
    ccall((:fann_set_quickprop_decay,libfann),Void,(Ptr{fann},Cfloat),ann,quickprop_decay)
end

function fann_get_quickprop_mu(ann::Ptr{fann})
    ccall((:fann_get_quickprop_mu,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_quickprop_mu(ann::Ptr{fann},quickprop_mu::Cfloat)
    ccall((:fann_set_quickprop_mu,libfann),Void,(Ptr{fann},Cfloat),ann,quickprop_mu)
end

function fann_get_rprop_increase_factor(ann::Ptr{fann})
    ccall((:fann_get_rprop_increase_factor,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_rprop_increase_factor(ann::Ptr{fann},rprop_increase_factor::Cfloat)
    ccall((:fann_set_rprop_increase_factor,libfann),Void,(Ptr{fann},Cfloat),ann,rprop_increase_factor)
end

function fann_get_rprop_decrease_factor(ann::Ptr{fann})
    ccall((:fann_get_rprop_decrease_factor,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_rprop_decrease_factor(ann::Ptr{fann},rprop_decrease_factor::Cfloat)
    ccall((:fann_set_rprop_decrease_factor,libfann),Void,(Ptr{fann},Cfloat),ann,rprop_decrease_factor)
end

function fann_get_rprop_delta_min(ann::Ptr{fann})
    ccall((:fann_get_rprop_delta_min,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_rprop_delta_min(ann::Ptr{fann},rprop_delta_min::Cfloat)
    ccall((:fann_set_rprop_delta_min,libfann),Void,(Ptr{fann},Cfloat),ann,rprop_delta_min)
end

function fann_get_rprop_delta_max(ann::Ptr{fann})
    ccall((:fann_get_rprop_delta_max,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_rprop_delta_max(ann::Ptr{fann},rprop_delta_max::Cfloat)
    ccall((:fann_set_rprop_delta_max,libfann),Void,(Ptr{fann},Cfloat),ann,rprop_delta_max)
end

function fann_get_rprop_delta_zero(ann::Ptr{fann})
    ccall((:fann_get_rprop_delta_zero,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_rprop_delta_zero(ann::Ptr{fann},rprop_delta_max::Cfloat)
    ccall((:fann_set_rprop_delta_zero,libfann),Void,(Ptr{fann},Cfloat),ann,rprop_delta_max)
end

function fann_get_sarprop_weight_decay_shift(ann::Ptr{fann})
    ccall((:fann_get_sarprop_weight_decay_shift,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_sarprop_weight_decay_shift(ann::Ptr{fann},sarprop_weight_decay_shift::Cfloat)
    ccall((:fann_set_sarprop_weight_decay_shift,libfann),Void,(Ptr{fann},Cfloat),ann,sarprop_weight_decay_shift)
end

function fann_get_sarprop_step_error_threshold_factor(ann::Ptr{fann})
    ccall((:fann_get_sarprop_step_error_threshold_factor,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_sarprop_step_error_threshold_factor(ann::Ptr{fann},sarprop_step_error_threshold_factor::Cfloat)
    ccall((:fann_set_sarprop_step_error_threshold_factor,libfann),Void,(Ptr{fann},Cfloat),ann,sarprop_step_error_threshold_factor)
end

function fann_get_sarprop_step_error_shift(ann::Ptr{fann})
    ccall((:fann_get_sarprop_step_error_shift,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_sarprop_step_error_shift(ann::Ptr{fann},sarprop_step_error_shift::Cfloat)
    ccall((:fann_set_sarprop_step_error_shift,libfann),Void,(Ptr{fann},Cfloat),ann,sarprop_step_error_shift)
end

function fann_get_sarprop_temperature(ann::Ptr{fann})
    ccall((:fann_get_sarprop_temperature,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_sarprop_temperature(ann::Ptr{fann},sarprop_temperature::Cfloat)
    ccall((:fann_set_sarprop_temperature,libfann),Void,(Ptr{fann},Cfloat),ann,sarprop_temperature)
end

function fann_cascadetrain_on_data(ann::Ptr{fann},data::Ptr{fann_train_data},max_neurons::Uint32,neurons_between_reports::Uint32,desired_error::Cfloat)
    ccall((:fann_cascadetrain_on_data,libfann),Void,(Ptr{fann},Ptr{fann_train_data},Uint32,Uint32,Cfloat),ann,data,max_neurons,neurons_between_reports,desired_error)
end

function fann_cascadetrain_on_file(ann::Ptr{fann},filename::Ptr{Uint8},max_neurons::Uint32,neurons_between_reports::Uint32,desired_error::Cfloat)
    ccall((:fann_cascadetrain_on_file,libfann),Void,(Ptr{fann},Ptr{Uint8},Uint32,Uint32,Cfloat),ann,filename,max_neurons,neurons_between_reports,desired_error)
end

function fann_get_cascade_output_change_fraction(ann::Ptr{fann})
    ccall((:fann_get_cascade_output_change_fraction,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_cascade_output_change_fraction(ann::Ptr{fann},cascade_output_change_fraction::Cfloat)
    ccall((:fann_set_cascade_output_change_fraction,libfann),Void,(Ptr{fann},Cfloat),ann,cascade_output_change_fraction)
end

function fann_get_cascade_output_stagnation_epochs(ann::Ptr{fann})
    ccall((:fann_get_cascade_output_stagnation_epochs,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_set_cascade_output_stagnation_epochs(ann::Ptr{fann},cascade_output_stagnation_epochs::Uint32)
    ccall((:fann_set_cascade_output_stagnation_epochs,libfann),Void,(Ptr{fann},Uint32),ann,cascade_output_stagnation_epochs)
end

function fann_get_cascade_candidate_change_fraction(ann::Ptr{fann})
    ccall((:fann_get_cascade_candidate_change_fraction,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_set_cascade_candidate_change_fraction(ann::Ptr{fann},cascade_candidate_change_fraction::Cfloat)
    ccall((:fann_set_cascade_candidate_change_fraction,libfann),Void,(Ptr{fann},Cfloat),ann,cascade_candidate_change_fraction)
end

function fann_get_cascade_candidate_stagnation_epochs(ann::Ptr{fann})
    ccall((:fann_get_cascade_candidate_stagnation_epochs,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_set_cascade_candidate_stagnation_epochs(ann::Ptr{fann},cascade_candidate_stagnation_epochs::Uint32)
    ccall((:fann_set_cascade_candidate_stagnation_epochs,libfann),Void,(Ptr{fann},Uint32),ann,cascade_candidate_stagnation_epochs)
end

function fann_get_cascade_weight_multiplier(ann::Ptr{fann})
    ccall((:fann_get_cascade_weight_multiplier,libfann),fann_type,(Ptr{fann},),ann)
end

function fann_set_cascade_weight_multiplier(ann::Ptr{fann},cascade_weight_multiplier::fann_type)
    ccall((:fann_set_cascade_weight_multiplier,libfann),Void,(Ptr{fann},fann_type),ann,cascade_weight_multiplier)
end

function fann_get_cascade_candidate_limit(ann::Ptr{fann})
    ccall((:fann_get_cascade_candidate_limit,libfann),fann_type,(Ptr{fann},),ann)
end

function fann_set_cascade_candidate_limit(ann::Ptr{fann},cascade_candidate_limit::fann_type)
    ccall((:fann_set_cascade_candidate_limit,libfann),Void,(Ptr{fann},fann_type),ann,cascade_candidate_limit)
end

function fann_get_cascade_max_out_epochs(ann::Ptr{fann})
    ccall((:fann_get_cascade_max_out_epochs,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_set_cascade_max_out_epochs(ann::Ptr{fann},cascade_max_out_epochs::Uint32)
    ccall((:fann_set_cascade_max_out_epochs,libfann),Void,(Ptr{fann},Uint32),ann,cascade_max_out_epochs)
end

function fann_get_cascade_min_out_epochs(ann::Ptr{fann})
    ccall((:fann_get_cascade_min_out_epochs,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_set_cascade_min_out_epochs(ann::Ptr{fann},cascade_min_out_epochs::Uint32)
    ccall((:fann_set_cascade_min_out_epochs,libfann),Void,(Ptr{fann},Uint32),ann,cascade_min_out_epochs)
end

function fann_get_cascade_max_cand_epochs(ann::Ptr{fann})
    ccall((:fann_get_cascade_max_cand_epochs,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_set_cascade_max_cand_epochs(ann::Ptr{fann},cascade_max_cand_epochs::Uint32)
    ccall((:fann_set_cascade_max_cand_epochs,libfann),Void,(Ptr{fann},Uint32),ann,cascade_max_cand_epochs)
end

function fann_get_cascade_min_cand_epochs(ann::Ptr{fann})
    ccall((:fann_get_cascade_min_cand_epochs,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_set_cascade_min_cand_epochs(ann::Ptr{fann},cascade_min_cand_epochs::Uint32)
    ccall((:fann_set_cascade_min_cand_epochs,libfann),Void,(Ptr{fann},Uint32),ann,cascade_min_cand_epochs)
end

function fann_get_cascade_num_candidates(ann::Ptr{fann})
    ccall((:fann_get_cascade_num_candidates,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_get_cascade_activation_functions_count(ann::Ptr{fann})
    ccall((:fann_get_cascade_activation_functions_count,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_get_cascade_activation_functions(ann::Ptr{fann})
    ccall((:fann_get_cascade_activation_functions,libfann),Ptr{fann_activationfunc_enum},(Ptr{fann},),ann)
end

function fann_set_cascade_activation_functions(ann::Ptr{fann},cascade_activation_functions::Ptr{fann_activationfunc_enum},cascade_activation_functions_count::Uint32)
    ccall((:fann_set_cascade_activation_functions,libfann),Void,(Ptr{fann},Ptr{fann_activationfunc_enum},Uint32),ann,cascade_activation_functions,cascade_activation_functions_count)
end

function fann_get_cascade_activation_steepnesses_count(ann::Ptr{fann})
    ccall((:fann_get_cascade_activation_steepnesses_count,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_get_cascade_activation_steepnesses(ann::Ptr{fann})
    ccall((:fann_get_cascade_activation_steepnesses,libfann),Ptr{fann_type},(Ptr{fann},),ann)
end

function fann_set_cascade_activation_steepnesses(ann::Ptr{fann},cascade_activation_steepnesses::Ptr{fann_type},cascade_activation_steepnesses_count::Uint32)
    ccall((:fann_set_cascade_activation_steepnesses,libfann),Void,(Ptr{fann},Ptr{fann_type},Uint32),ann,cascade_activation_steepnesses,cascade_activation_steepnesses_count)
end

function fann_get_cascade_num_candidate_groups(ann::Ptr{fann})
    ccall((:fann_get_cascade_num_candidate_groups,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_set_cascade_num_candidate_groups(ann::Ptr{fann},cascade_num_candidate_groups::Uint32)
    ccall((:fann_set_cascade_num_candidate_groups,libfann),Void,(Ptr{fann},Uint32),ann,cascade_num_candidate_groups)
end

function fann_create_from_file(configuration_file::Ptr{Uint8})
    ccall((:fann_create_from_file,libfann),Ptr{fann},(Ptr{Uint8},),configuration_file)
end

function fann_save(ann::Ptr{fann},configuration_file::Ptr{Uint8})
    ccall((:fann_save,libfann),Cint,(Ptr{fann},Ptr{Uint8}),ann,configuration_file)
end

function fann_save_to_fixed(ann::Ptr{fann},configuration_file::Ptr{Uint8})
    ccall((:fann_save_to_fixed,libfann),Cint,(Ptr{fann},Ptr{Uint8}),ann,configuration_file)
end

function fann_create_standard_array(num_layers::Uint32,layers::Ptr{Uint32})
    ccall((:fann_create_standard_array,libfann),Ptr{fann},(Uint32,Ptr{Uint32}),num_layers,layers)
end

function fann_create_sparse_array(connection_rate::Cfloat,num_layers::Uint32,layers::Ptr{Uint32})
    ccall((:fann_create_sparse_array,libfann),Ptr{fann},(Cfloat,Uint32,Ptr{Uint32}),connection_rate,num_layers,layers)
end

function fann_create_shortcut_array(num_layers::Uint32,layers::Ptr{Uint32})
    ccall((:fann_create_shortcut_array,libfann),Ptr{fann},(Uint32,Ptr{Uint32}),num_layers,layers)
end

function fann_destroy(ann::Ptr{fann})
    ccall((:fann_destroy,libfann),Void,(Ptr{fann},),ann)
end

function fann_copy(ann::Ptr{fann})
    ccall((:fann_copy,libfann),Ptr{fann},(Ptr{fann},),ann)
end

function fann_run(ann::Ptr{fann},input::Ptr{fann_type})
    ccall((:fann_run,libfann),Ptr{fann_type},(Ptr{fann},Ptr{fann_type}),ann,input)
end

function fann_randomize_weights(ann::Ptr{fann},min_weight::fann_type,max_weight::fann_type)
    ccall((:fann_randomize_weights,libfann),Void,(Ptr{fann},fann_type,fann_type),ann,min_weight,max_weight)
end

function fann_init_weights(ann::Ptr{fann},train_data::Ptr{fann_train_data})
    ccall((:fann_init_weights,libfann),Void,(Ptr{fann},Ptr{fann_train_data}),ann,train_data)
end

function fann_print_connections(ann::Ptr{fann})
    ccall((:fann_print_connections,libfann),Void,(Ptr{fann},),ann)
end

function fann_print_parameters(ann::Ptr{fann})
    ccall((:fann_print_parameters,libfann),Void,(Ptr{fann},),ann)
end

function fann_get_num_input(ann::Ptr{fann})
    ccall((:fann_get_num_input,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_get_num_output(ann::Ptr{fann})
    ccall((:fann_get_num_output,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_get_total_neurons(ann::Ptr{fann})
    ccall((:fann_get_total_neurons,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_get_total_connections(ann::Ptr{fann})
    ccall((:fann_get_total_connections,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_get_network_type(ann::Ptr{fann})
    ccall((:fann_get_network_type,libfann),Cint,(Ptr{fann},),ann)
end

function fann_get_connection_rate(ann::Ptr{fann})
    ccall((:fann_get_connection_rate,libfann),Cfloat,(Ptr{fann},),ann)
end

function fann_get_num_layers(ann::Ptr{fann})
    ccall((:fann_get_num_layers,libfann),Uint32,(Ptr{fann},),ann)
end

function fann_get_layer_array(ann::Ptr{fann},layers::Ptr{Uint32})
    ccall((:fann_get_layer_array,libfann),Void,(Ptr{fann},Ptr{Uint32}),ann,layers)
end

function fann_get_bias_array(ann::Ptr{fann},bias::Ptr{Uint32})
    ccall((:fann_get_bias_array,libfann),Void,(Ptr{fann},Ptr{Uint32}),ann,bias)
end

function fann_get_connection_array(ann::Ptr{fann},connections::Ptr{fann_connection})
    ccall((:fann_get_connection_array,libfann),Void,(Ptr{fann},Ptr{fann_connection}),ann,connections)
end

function fann_set_weight_array(ann::Ptr{fann},connections::Ptr{fann_connection},num_connections::Uint32)
    ccall((:fann_set_weight_array,libfann),Void,(Ptr{fann},Ptr{fann_connection},Uint32),ann,connections,num_connections)
end

function fann_set_weight(ann::Ptr{fann},from_neuron::Uint32,to_neuron::Uint32,weight::fann_type)
    ccall((:fann_set_weight,libfann),Void,(Ptr{fann},Uint32,Uint32,fann_type),ann,from_neuron,to_neuron,weight)
end

function fann_set_user_data(ann::Ptr{fann},user_data::Ptr{Void})
    ccall((:fann_set_user_data,libfann),Void,(Ptr{fann},Ptr{Void}),ann,user_data)
end

function fann_get_user_data(ann::Ptr{fann})
    ccall((:fann_get_user_data,libfann),Ptr{Void},(Ptr{fann},),ann)
end
# Julia wrapper for header: ../deps/usr/include/fann_cpp.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

