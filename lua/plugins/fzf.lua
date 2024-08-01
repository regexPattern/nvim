return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  enabled = not vim.g.minimal,
  cmd = "FzfLua",
  event = "LspAttach",
  config = function()
    local actions = require("fzf-lua.actions")
    local fzf = require("fzf-lua")

    fzf.setup({
      winopts = {
        border = false,
        fullscreen = true,
        preview = { hidden = "hidden" },
      },
      keymap = {
        fzf = {
          ["ctrl-z"] = "abort",
          ["ctrl-q"] = "select-all+accept",
          ["ctrl-a"] = "beginning-of-line",
        },
      },
      files = {
        actions = {
          ["ctrl-g"] = { actions.toggle_ignore },
          ["ctrl-d"] = function(selected, opts)
            local path_utils = require("fzf-lua.path")
            local file_path = path_utils.entry_to_file(selected[1]).path
            local dir_path = path_utils.join({
              ---@diagnostic disable-next-line: undefined-field
              opts.cwd or (vim.uv or vim.loop).cwd(),
              vim.fn.fnamemodify(file_path, ":h"),
            })
            vim.cmd.edit(dir_path)
          end,
        },
      },
      fzf_opts = { ["--layout"] = "default" },
      file_icon_padding = " ",
    })

    fzf.register_ui_select()
  end,
  keys = {
    { "<Leader>ff", ":FzfLua files<CR>" },
    { "<Leader>fg", ":FzfLua grep<CR>" },
    { "<Leader>fd", ":FzfLua files fd_opts=--type\\ d file_icons=false<CR>" },
    { "<Leader>nv", ":FzfLua files cwd=" .. vim.fn.stdpath("config") .. "<CR>" },
    { "<Leader>df", ":FzfLua files cwd=~/.dotfiles<CR>" },
  },
}
