return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-refactor" },
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        refactor = {
          highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
          },
        },
      })
    end
  },
  {
    "Darazaki/indent-o-matic",
    event = "BufReadPost",
    config = true,
  }
}
