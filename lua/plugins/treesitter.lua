return {
  "https://github.com/nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  main = "nvim-treesitter.configs",
  opts = {
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
