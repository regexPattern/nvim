return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  opts = {
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
    fzf_opts = {
      ["--layout"] = false,
    },
    file_icon_padding = "",
  },
  config = function(spec)
    local fzf = require "fzf-lua"
    fzf.setup(spec.opts)
    fzf.register_ui_select()
  end,
  keys = {
    { "<Leader>ff", ":FzfLua files<CR>" },
    { "<Leader>fb", ":FzfLua buffers<CR>" },
    { "<Leader>fg", ":FzfLua live_grep<CR>" },
    { "<Leader>fw", ":FzfLua grep_cword<CR>" },
    { "z=",         ":FzfLua spell_suggest<CR>" },
    {
      "<Leader>nv",
      ":FzfLua files cwd=" .. vim.fn.stdpath "config" .. "<CR>",
    },
    { "<Leader>df", ":FzfLua files cwd=~/.dotfiles<CR>" },
    {
      "<Leader>fe",
      function()
        local searched_ext = vim.fn.input "Extension: "
        require("fzf-lua").files { cmd = "fd -e " .. searched_ext }
      end,
    },
  },
}
