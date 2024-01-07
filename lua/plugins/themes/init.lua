local theme = require "plugins.themes.minimal"

return vim.tbl_extend("force", theme, {
  lazy = false,
  priority = 1000,
})
