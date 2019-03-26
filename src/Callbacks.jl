"Function Compositions"
module Callbacks

import ProgressMeter
import UnicodePlots

include("mmap.jl")    # Helper functions
include("cbnode.jl")  # Callback node: Tree function structure
include("error.jl")   # Inf/Nan
include("stage.jl")   # 
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
        plotrv,
        plotscalar,
        stopnanorinf,
        runall,
        handlesignal,
        default_cbs,
        HMCStep,
        IterEnd,
        default_cbs_tpl,
        default_cbs,
        capturevals

end
