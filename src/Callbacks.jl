"Function Compositions"
module Callbacks

import ProgressMeter
import UnicodePlots

include("mmap.jl")    # Helper functions
include("cbnode.jl")  # Callback node: Tree function structure
include("error.jl")   # Inf/Nan
include("stage.jl")
include("signal.jl")
include("std.jl")
include("plot.jl")

export  mapf,
        foreachf,
        everyn,
        →,
        donothing,
        showprogress,
        idcb,
        throttle,
        plotscalar,
        stopnanorinf,
        runall,
        handlesignal,
        HMCStep,
        IterEnd,
        capturevals

end
