using Callbacks, Pkg
Pkg.add(PackageSpec("Lens", rev = "master"))
using Lens

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

@leval Loop => (everyn(1000000) → plotscalar()) simulation()