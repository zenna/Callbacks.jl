"Stage of algorithm at which callback is called.
 Callback has type f(data, stage::Type{<:Stage}."
abstract type Stage end

""
abstract type HMCStep <: Stage end

"End of Iteration"
abstract type IterEnd <: Stage end
