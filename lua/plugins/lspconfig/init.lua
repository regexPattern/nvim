return {
  {
    "neovim/nvim-lspconfig",
    enabled = not vim.g.minimal,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "b0o/SchemaStore.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local opts = require("plugins.lspconfig.server_configs")[server_name] or {}
            require("lspconfig")[server_name].setup(opts)
          end,
        },
      })

      require("plugins.lspconfig.setup")
    end,
  },
  {
    "j-hui/fidget.nvim",
    enabled = not vim.g.minimal,
    event = "LspAttach",
    opts = {
      notification = {
        window = {
          winblend = 0,
          max_width = 60,
        },
      },
    },
  },
  {
    "felpafel/inlay-hint.nvim",
    enabled = not vim.g.minimal,
    event = "LspAttach",
    config = true,
  },
}
