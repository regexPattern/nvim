return {} --[[ {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    update_focused_file = {
      enable = false,
    },
    on_attach = function(bufnr)
      local api = require "nvim-tree.api"
      local opts = { buffer = bufnr, silent = true }

      vim.keymap.set("n", "R", api.fs.rename, opts)
      vim.keymap.set("n", "<CR>", api.node.open.edit, opts)
      vim.keymap.set("n", "%", api.fs.create, opts)
      vim.keymap.set("n", "D", api.fs.remove, opts)
      vim.keymap.set("n", "H", api.tree.collapse_all, opts)
    end,
  },
  keys = {
    { "<Leader>E", ":NvimTreeToggle<CR>", silent = true },
  },
} ]]
