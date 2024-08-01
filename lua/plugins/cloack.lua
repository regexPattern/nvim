return {
  "laytan/cloak.nvim",
  enabled = not vim.g.minimal,
  event = "BufReadPost",
  opts = {
    patterns = {
      {
        file_pattern = ".env*",
        cloak_pattern = "=.+",
      },
    },
  },
}
