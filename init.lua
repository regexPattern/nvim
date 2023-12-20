require "settings"
require "mappings"
require "diagnostics"
require "magic"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

---@diagnostic disable-next-line
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  defaults = { lazy = true },
  install = { colorscheme = { "default" } },
  change_detection = { enabled = false },
})
