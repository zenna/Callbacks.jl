"Has the optimization converged?"
function converged(every, print_change=True, change_thres=-0.000005):
  function converged_gen(every)
    running_loss = 0.0
    last_running_loss = 0.0
    show_change = False
    cont = True
    while true:
      data = yield cont
      if data.loss is None:
        continue
      running_loss += data.loss
      if (data.i + 1) % every == 0:
        if show_change:
          change = (running_loss - last_running_loss)
          print('absolute change (avg over {}) {}'.format(every, change))
          if last_running_loss != 0:
            relchange = change / last_running_loss
            per_iter = relchange / every
            print('relative_change: {}, per iteration: {}'.format(relchange,
                                                                  per_iter))
            if per_iter > change_thres:
              print("Relative change insufficeint, stopping!")
              cont = False
        else:
          show_change = True
        last_running_loss = running_loss
        running_loss = 0.0

  gen = converged_gen(every)
  next(gen)
  return gen
end
end

"Has optimization converged?"
function isconverged(; verbose = false)
  lastrunningℓ = 0.0
  runningℓ = 0.0
  lastℓ = 0.0
  function checkconverged(ℓ)
    runningℓ += ℓ
    Δℓ = runningℓ - lastrunningℓ
    verbose && println("Absolute change $Δℓ")
    if lastrunningℓ != 0
      relativeΔ = Δℓ / lastrunningℓ
      periterΔ = relativeΔ / every
    end
  end 
end
