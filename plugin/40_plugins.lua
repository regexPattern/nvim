local add = vim.pack.add
local now, now_if_args, later = Config.now, Config.now_if_args, Config.later

now(function ()
  add({
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/Mirsmog/real-icons.nvim"
  })

  require("fzf-lua").setup(require("config.fzf-lua"))
  require("fzf-lua").register_ui_select()
  require("real-icons").setup(require("config.real-icons"))
  require("oil").setup(require("config.oil"))
end)

now(function ()
  add({
    "https://github.com/nvim-mini/mini.align",
    "https://github.com/nvim-mini/mini.surround"
  })
  require("mini.align").setup({})
  require("mini.surround").setup({})
end)

now_if_args(function ()
  add({ "https://github.com/arborist-ts/arborist.nvim" })
  require("arborist").setup({})
end)

later(function ()
  add({ "https://github.com/brenoprata10/nvim-highlight-colors" })
  ---@diagnostic disable-next-line: undefined-field
  require("nvim-highlight-colors").setup({})
  vim.cmd.packadd("nohlsearch")
end)

now(function ()
  add({ "https://github.com/stevearc/conform.nvim" })
  require("conform").setup(require("config.conform"))
end)
