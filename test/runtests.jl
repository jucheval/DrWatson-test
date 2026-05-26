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

@testset verbose = false "Code quality (Aqua.jl)" begin
    Aqua.test_all(DrWatsonExample)
end
println("----")
@testset verbose = false "Formatting" begin
    @test format(DrWatsonExample; overwrite = false)
end
println("----")
@testset verbose = false "ExplicitImports" begin
    test_all_explicit_imports_are_public(DrWatsonExample)
    test_all_qualified_accesses_are_public(DrWatsonExample)
    test_all_explicit_imports_via_owners(DrWatsonExample)
    test_all_qualified_accesses_via_owners(DrWatsonExample)
    test_no_implicit_imports(DrWatsonExample)
    test_no_self_qualified_accesses(DrWatsonExample)
    test_no_stale_explicit_imports(DrWatsonExample)
end

ti = time() - ti
println("\nTest took total time of:")
println(round(ti / 60, digits = 3), " minutes")
