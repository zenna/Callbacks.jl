# Callbacks

[![Build Status](https://travis-ci.org/zenna/Callbacks.jl.svg?branch=master)](https://travis-ci.org/zenna/Callbacks.jl)


Tools for constructing callbacks, and a set of callbacks useful for monitoring/measuring simulations.

This package is most useful in combination with [Lens](github.com/zenna/Lens.jl).

The following example will update a UnicodePlot at every time step.

```julia
using Callbacks, Lens

struct Loop end
function simulation()
  x = 0.0
  while true
    y = sin(x)
    lens(Loop, (x = x, y = y))
    x += rand()
  end
end

@leval Loop => plotscalar() simlulation()
```

This may be a bit more frequent than what I need.
Rather than update every time step, we can update every 1000000.

```julia
@leval Loop => (everyn(1000000) → plotscalar()) simulation()
```