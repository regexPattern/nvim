return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    flavour = "mocha",
    transparent_background = true,
    show_end_of_buffer = true,
    no_italic = true,
    integrations = {
      cmp = true,
      fidget = true,
      neotree = true,
      semantic_tokens = true,
      treesitter = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
    },
  },
  config = function(spec)
    require("catpuccin").setup(spec.opts)
    vim.cmd [[ colo catppuccin ]]
  end,
}
