return {
  "yazeed1s/minimal.nvim",
  init = function()
    vim.g.minimal_italic_comments = false
    vim.g.minimal_transparent_background = true
  end,
  config = function()
    vim.cmd.colorscheme "minimal-base16"
  end,
}
