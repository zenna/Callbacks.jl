using FileIO: save

export incsave, backupsave, savecb

# Nomenclature
# path: /path/to/file.ext
# ext
# basename: file.ext
# dirname: /path/to
# root file

ext(path) = split(path, ".")[end]
root(path) = join(split(path, ".")[1:end-1], ".")

"`extroot(path, middle)` Inserts `middle` before extension of `path`"
extroot(path, middle; delim = "_") = "$(root(path))$delim$middle.$(ext(path))"

"Save file to `path` using `save(path, data)` backup if necessary"
function backupsave(val, path; backup = false, verbose = false, save = save, force = true)
  # zt: fixme, this should be recursive
  if backup && isfile(path)
    verbose && println("File $path exists, backing up")
    backuppath = extroot(path, "backup")
    mv(path, backuppath; force = force)
  end
  verbose && println("Saving $path")
  save(path, val)
end

"Save to file incrementing counter every time"
function incsave(path; i = 1, kwargs...)
  function incsave(val)
    incpath = extroot(path, "$i")
    backupsave(val, incpath, kwargs...)
    i += 1
  end
end

savecb(path; backup, verbose = false) = x -> backupsave(x, path; backup = backup, verbose = verbose)
