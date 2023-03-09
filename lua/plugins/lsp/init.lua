return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
      "b0o/SchemaStore.nvim",
      "hrsh7th/cmp-nvim-lsp",
      {
        "lvimuser/lsp-inlayhints.nvim",
        config = true,
      },
      -- {
      --   "folke/neodev.nvim",
      --   config = true,
      -- }
    },
    config = function()
      require("mason").setup()
      local mason_lspconfig = require("mason-lspconfig")

      -- servers installed with mason
      mason_lspconfig.setup_handlers({
        function(server)
          local override = require("plugins.lsp.configs")[server] or {}
          local opts = vim.tbl_extend("keep", override, {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
          })
          require("lspconfig")[server].setup(opts)
        end
      })

      require("plugins.lsp.handlers")
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = {
      fmt    = { stack_upwards = false },
      window = { blend = 0 },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null = require("null-ls")

      null.setup({
        sources = {
          null.builtins.formatting.prettierd,
          null.builtins.formatting.rustfmt,
        },
      })
    end,
  },
}
