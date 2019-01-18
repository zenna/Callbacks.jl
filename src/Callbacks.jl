"Function Compositions"
module Callbacks

import ProgressMeter

include("mmap.jl")
include("cbnode.jl")
include("error.jl")
include("stage.jl")
include("signal.jl")
include("std.jl")

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