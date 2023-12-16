return {
  "navarasu/onedark.nvim",
  opts = {
    style = "dark",
    transparent = false,
  },
  config = function(spec)
    local onedark = require "onedark"
    onedark.setup(spec.opts)
    onedark.load()
  end,
}
