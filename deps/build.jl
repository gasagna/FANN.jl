using BinDeps

# Heavily taken from Sundials.jl build.jl file.
@BinDeps.setup

fannlib = library_dependency("libfann")
version = "FANN-2.2.0-Source"
uri = "http://sourceforge.net/projects/fann/files/fann/2.2.0/$version.tar.gz"

provides(Sources, URI(uri), fannlib, MD5="c9d6c8da5bb70276352a1718a668562c")

prefix = joinpath(BinDeps.depsdir(fannlib),"usr")
srcdir = joinpath(BinDeps.depsdir(fannlib),"src", version) 

provides(SimpleBuild,
    (@build_steps begin
        GetSources(fannlib)
        @build_steps begin
            ChangeDirectory(srcdir)
            `cmake -DCMAKE_INSTALL_PREFIX=$prefix .`
            `make install`
        end
    end), fannlib)

@BinDeps.install [:libfann => :libfann]