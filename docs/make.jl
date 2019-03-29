using Documenter
using Callbacks

makedocs(
    sitename = "Callbacks",
    format = :html,
    modules = [Callbacks]
    pages = ["Home" => "index.md"
             "Library" => "library.md",
             "Compose" => "cbnode.md"]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#


deploydocs(
  repo = "github.com/zenna/Callbacks.jl.git",
)
