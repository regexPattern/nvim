return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  dependencies = {{ "nvim-tree/nvim-web-devicons", config = true }},
  config = function()
    local fzf = require("fzf-lua")

    fzf.setup({
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },
      winopts = {
        fullscreen = true,
        border = "none",
        preview = { hidden = "hidden" },
      },
      -- move the prompt to the bottom.
      fzf_opts = { ["--layout"] = false },
    })

    fzf.register_ui_select()
  end,
  keys = {
    { "<Leader>ff", ":FzfLua files<CR>", silent = true },
    { "<Leader>fg", ":FzfLua live_grep<CR>", silent = true },
    { "<Leader>fw", ":FzfLua grep_cword<CR>", silent = true },
    {
      "<Leader>nv",
      ":FzfLua files cwd=" .. vim.fn.stdpath("config") .. "<CR>",
      silent = true,
    },
    { "<Leader>df", ":FzfLua files cwd=~/.dotfiles<CR>", silent = true },
  },
}
