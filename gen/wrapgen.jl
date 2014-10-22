using Clang.wrap_c

context = wrap_c.init(output_file="../src/libfann.jl", 
					  header_library=x->"libfann", 
					  common_file="../src/libfann_common.jl", 
					  clang_diagnostics=true)

context.options.wrap_structs = true

wrap_c.wrap_c_headers(context, ["../deps/usr/include/doublefann.h",
								"../deps/usr/include/fann.h",
								"../deps/usr/include/fann_activation.h",
								"../deps/usr/include/fann_cascade.h",
								"../deps/usr/include/fann_cpp.h",
								"../deps/usr/include/fann_data.h",
								"../deps/usr/include/fann_error.h",
								"../deps/usr/include/fann_internal.h",
								"../deps/usr/include/fann_io.h",
								"../deps/usr/include/fann_train.h"])