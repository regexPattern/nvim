return vim.tbl_deep_extend("force", require("plugins.colors.ayu"), {
  lazy = false,
  priority = 1000,
})
