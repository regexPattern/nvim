-- Plugin agnostic settings
require("core.settings")
require("core.mappings")
require("core.commands")

-- Plugin and plugin manager (Lazy.nvim) setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  change_detection = { notify = false },
  default = { lazy = true },
  install = { colorscheme = { "nord" } },
})

if vim.g.neovide then
  vim.o.guifont = "JetBrains Mono:h14"
  vim.g.neovide_padding_top = 16
  vim.g.neovide_padding_bottom = 16
  vim.g.neovide_padding_right = 16
  vim.g.neovide_padding_left = 16
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_animate_command_line = false
end
