using BenchmarkTools, DrWatsonExample

const SUITE = BenchmarkGroup()

# Create hierarchy of benchmarks:
SUITE["dummy_project_function"] = BenchmarkGroup()

for n in [10, 20]
    SUITE["dummy_project_function"][n] = @benchmarkable(
        dummy_project_function(X, Y),
        evals = 10,
        samples = 1000,
        setup = (X=randn(Float32, 2, $n), Y=randn(Float32, 2, $n))
    )
end