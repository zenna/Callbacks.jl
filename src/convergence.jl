"true iff `mul Δℓ / Δt *  < thres`"
function isconverged(; mul = 1.0, verbose = false, thresh = -5e-6)
  lastt = 0.0
  lastℓ = 0.0
  suffdata = false
  function checkconverged((t, ℓ))
    Δℓ = ℓ - lastℓ
    Δt = t - lastt

    lastℓ = ℓ
    lastt = t

    verbose && println("Δℓ / Δt:", Δℓ / Δt) 

    converged_ = suffdata && mul * Δℓ / Δt > thresh
    suffdata = true
    converged_
  end 
end  

struct Stop{T} <: Exception
  msg::T
end

stop(msg = "") = throw(Stop("msg"))

"Stops if optimization has converged"
function stopconverged(; kwargs...)
  let f = isconverged(; kwargs...)
    (p -> p && stop("converged")) ∘ f
  end
end