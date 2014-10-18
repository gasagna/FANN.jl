using Clang.wrap_c

context = wrap_c.init(output_file="../src/libfann.jl", 
					  header_library=x->"libfann", 
					  common_file="../src/libfann_common.jl", 
					  clang_diagnostics=true)

context.options.wrap_structs = true

wrap_c.wrap_c_headers(context, ["/usr/include/doublefann.h",
								"/usr/include/fann.h",
							    "/usr/include/fann_activation.h",
							    "/usr/include/fann_cascade.h",
							    "/usr/include/fann_data.h",
							    "/usr/include/fann_error.h",
							    "/usr/include/fann_internal.h",
							    "/usr/include/fann_io.h",
							    "/usr/include/fann_train.h"])