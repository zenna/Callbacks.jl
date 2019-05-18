using UnicodePlots


function testisconverged(f, Δ = 0.01, x0 = 0.0)
  xs = [x0]
  ys = f.(xs)
  c = isconverged()
  while true
    display(lineplot(xs, ys))
    x = xs[end] + Δ
    y = f(x)
    push!(xs, x)
    push!(ys, y)
    @show converged_ = c((x, y))
    if converged_
      break
    end
  end
end

j(k) = exp(-k)

testisconverged(j)
