using DrWatsonExample
using Test
using Aqua
using JuliaFormatter
using ExplicitImports

# Here you include files using `srcdir`
# include(srcdir("file.jl"))

# Run test suite
println("Starting tests")
ti = time()

@testset "DrWatsonExample tests" begin
    @test 1 == 1
    @test dummy_project_function(1, 1) == 2
end

ti = time() - ti
println("\nTest took total time of:")
println(round(ti / 60, digits=3), " minutes")
