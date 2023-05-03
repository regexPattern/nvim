return vim.tbl_extend(
  "force",
  require("plugins.themes.gruvbox-material"),
  {
    lazy = false,
    priority = 1000,
  }
)
