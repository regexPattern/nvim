-- Neovim nightly config, organized like MiniMax's nvim-0.13 reference:
-- plugin/10_*: options; 20_*: keymaps/diagnostics; 30_*: LSP;
-- 40_*: other plugins; after/lsp/: server-specific overrides.
vim.g.mapleader = " "

_G.Config = {}

local group = vim.api.nvim_create_augroup("custom-config", { clear = true })
Config.new_autocmd = function (event, pattern, callback, desc)
  return vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = callback,
    desc = desc
  })
end

-- Use the standalone module rather than installing all of mini.nvim.
vim.pack.add({ "https://github.com/nvim-mini/mini.misc" })
local misc = require("mini.misc")
Config.now = function (f) misc.safely("now", f) end
Config.later = function (f) misc.safely("later", f) end
Config.now_if_args = vim.fn.argc(-1) > 0 and Config.now or Config.later

-- Disable built-in explorers before their plugin scripts are sourced.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_nvim_dir_plugin = 1

vim.api.nvim_create_user_command("Clean", function ()
  local names = {}

  for _, plugin in ipairs(vim.pack.get(nil, { info = false })) do
    if not plugin.active then
      names[#names + 1] = plugin.spec.name
    end
  end

  vim.pack.del(names)
end)
