return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({
      keymap = {
        fzf = { ["ctrl-q"] = "select-all+accept" },
      },
      winopts = {
        fullscreen = true,
        border = "none",
        preview = { hidden = "hidden" },
      },
      fzf_opts = { ["--layout"] = false },
      file_icon_padding = " ",
    })

    require("fzf-lua").register_ui_select()
  end,
  keys = {
    { "<Leader>ff", ":FzfLua files<CR>" },
    { "<Leader>fg", ":FzfLua live_grep<CR>" },
    { "z=",         ":FzfLua spell_suggest<CR>" },
    {
      "<Leader>nv",
      ":FzfLua files cwd=" .. vim.fn.stdpath "config" .. "<CR>",
    },
    {
      "<Leader>fe",
      function()
        local query = vim.fn.input "Extension: "
        require("fzf-lua").files { cmd = "fd -e " .. query }
      end,
    },
  },
}
