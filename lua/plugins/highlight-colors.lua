return {
  "brenoprata10/nvim-highlight-colors",
  event = "BufReadPost",
  opts = {
    enable_named_colors = false,
    exclude_buftypes = { "nofile" },
  },
}
