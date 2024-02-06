return {
  "https://github.com/yazeed1s/minimal.nvim",
  config = function()
    vim.cmd [[ colorscheme minimal-base16 ]]

    vim.cmd [[ highlight PmenuSel gui=reverse ]]
    vim.cmd [[ highlight NvimTreeCursorLine guifg=NONE ]]
    vim.cmd [[ highlight NvimTreeEmptyFolderName guifg=#cacbd4 gui=NONE ]]
    vim.cmd [[ highlight NvimTreeOpenedFolderName gui=NONE ]]
  end,
  init = function()
    vim.g.minimal_italic_comments = false
    vim.g.minimal_transparent_background = true
  end,
}
