return {
  "lewis6991/gitsigns.nvim",
  enabled = false,
  event = { "BufReadPre", "BufNewFile" },
  config = {
    signcolumn = true,
    numhl = false,
    linehl = false,
    attach_to_untracked = false,
    current_line_blame = false,
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
  },
}
