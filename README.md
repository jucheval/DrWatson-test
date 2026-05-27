# Example of DrWatson scientific project

This code base is an example of a scientific project using [DrWatson](https://juliadynamics.github.io/DrWatson.jl/stable/) coupled with features available for standard [Julia](https://julialang.org/) packages.

The two features are:

- use Julia's standard package testing framework (e.g. `Pkg.test()` or the `] test` macro) to run tests with test-specific dependencies, and
- use [AirSpeedVelocity](https://astroautomata.com/AirspeedVelocity.jl/stable/#further-examples) to add benchmark results on every PR and avoid performance regressions.

## Installation

To (locally) reproduce this project, do the following:

1. Download this code base. Notice that raw data are typically not included in the
   git-history and may need to be downloaded independently.
2. Open a Julia console and do:

   ```
   julia> using Pkg
   julia> Pkg.add("DrWatson") # install globally, for using `quickactivate`
   julia> Pkg.activate("path/to/this/project")
   julia> Pkg.instantiate()
   ```

This will install all necessary packages for you to be able to run the scripts and
everything should work out of the box, including correctly finding local paths.

You may notice that most scripts start with the commands:

```julia
using DrWatson
@quickactivate "DrWatsonExample"
```

which auto-activate the project and enable local path handling from DrWatson.
