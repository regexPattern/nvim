return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(spec)
    require("nvim-treesitter.configs").setup(spec.opts)

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.jinja = {
      install_info = {
        url = "https://github.com/dbt-labs/tree-sitter-jinja2",
        files = { "src/parser.c" },
        branch = "main",
      },
    }

    vim.treesitter.language.register("jinja", "html")
  end,
}
