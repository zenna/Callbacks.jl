"Stage of algorithm at which callback is called.
 Callback has type f(data, stage::Type{<:Stage}."
abstract type Stage end

""
abstract type Inside <: Stage end

"Stage at end of MHStep"
abstract type Outside <: Stage end
