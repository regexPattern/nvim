return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    {
      "Darazaki/indent-o-matic",
      config = {
        max_lines = 128,
        standard_widths = { 2, 4, 8 },
        skip_multiline = true,
      },
    },
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      indent = {
        enable = true,
      },
      context_commentstring = { enable = true },
      ensure_installed = {
        "lua",
        "rust",
        "vimdoc",
      },
      sync_install = false,
      auto_install = true,
    })
  end,
}
