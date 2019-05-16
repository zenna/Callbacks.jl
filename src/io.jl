"Save file to `path` using `save(path, data)` backup if necessary"
function backupsave(val, path; backup, verbose = false, save)
  fname = "$path.jld2"
  # zt: fixme, this should be recursive
  if backup && isfile(fname)
    verbose && println("File $fname exists, backing up")
    mv(fname, "$(path)_backup.jld2"; force = true)
  end
  verbose && println("Saving $fname")
  save(fname, Dict("data" => val))
end

function savecb(path; backup, verbose = false)
  function innersave(data)
    savejld(data, path; backup = backup, verbose = verbose)
  end
end