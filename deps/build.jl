using BinDeps

# Heavily taken from Sundials.jl build.jl file.
@BinDeps.setup

fannlib = library_dependency("libdoublefann")
uri = "https://github.com/libfann/fann/archive/master.zip"

provides(Sources, URI(uri), fannlib, unpacked_dir="fann-master")

prefix = joinpath(BinDeps.depsdir(fannlib),"usr")
srcdir = joinpath(BinDeps.depsdir(fannlib),"src", "fann-master") 

provides(SimpleBuild,
    (@build_steps begin
        GetSources(fannlib)
        @build_steps begin
            ChangeDirectory(srcdir)
            `cmake -DCMAKE_INSTALL_PREFIX=$prefix .`
            `make install`
        end
    end), fannlib)

@BinDeps.install [:libdoublefann => :libfann]