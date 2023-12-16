local theme = require "plugins.themes.github"

return vim.tbl_extend("force", theme, {
  lazy = false,
  priority = 1000,
})
