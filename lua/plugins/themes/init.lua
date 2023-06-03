return vim.tbl_extend(
  "force",
  require("plugins.themes.nord"),
  {
    lazy = false,
    priority = 1000,
  }
)
