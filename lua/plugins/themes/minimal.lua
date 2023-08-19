return {
  "yazeed1s/minimal.nvim",
  config = function()
    vim.g.minimal_italic_comments = false
    vim.g.minimal_transparent_background = true

    vim.cmd([[ colorscheme minimal-base16 ]])
  end,
}
