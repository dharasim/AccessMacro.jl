# AccessMacro

[![Build Status](https://travis-ci.org/dharasim/AccessMacro.jl.svg?branch=master)](https://travis-ci.org/dharasim/AccessMacro.jl)

[![Coverage Status](https://coveralls.io/repos/dharasim/AccessMacro.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/dharasim/AccessMacro.jl?branch=master)

[![codecov.io](http://codecov.io/github/dharasim/AccessMacro.jl/coverage.svg?branch=master)](http://codecov.io/github/dharasim/AccessMacro.jl?branch=master)

This package provides a convenience macro that automatically creates access functions. They, for example, can be used to abstract from the internal representation of an object.

## Usage

```julia
julia> using AccessMacro

julia> @access struct Foo{S, T}
           x :: S
           y :: T
       end
Foo

julia> x(Foo(1, "2"))
1

julia> y(Foo(1, "2"))
"2"
```
