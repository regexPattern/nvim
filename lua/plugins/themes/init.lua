return vim.tbl_extend(
  "force",
  require("plugins.themes.catppuccin"),
  {
    lazy = false,
    priority = 1000,
  }
)
