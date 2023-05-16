return {
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPost",
  enabled = not vim.g.minimal,
  config = {
    user_default_options = {
      names = false,
      tailwind = "lsp",
    },
  },
}
