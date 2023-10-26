--[[ return vim.tbl_extend("force", require("plugins.themes.nord"), {
  lazy = false,
  priority = 1000,
}) ]]

vim.opt.cursorline = true
vim.cmd.hi("NormalFloat guibg=NONE")
vim.cmd.hi("CursorLine guibg=NONE")
vim.cmd.hi("CursorLineNr guifg=yellow")
vim.cmd.hi("LineNr guifg=gray")

return {}
