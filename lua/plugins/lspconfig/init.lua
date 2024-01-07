return {
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "neovim/nvim-lspconfig",
        init = function()
          require "plugins.lspconfig.setup"
        end,
        dependencies = { "b0o/schemastore.nvim" },
      },
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true,
      },
    },
    opts = {
      handlers = {
        function(server)
          local config = require("plugins.lspconfig.server-configs")[server] or {}
          require("lspconfig")[server].setup(vim.tbl_deep_extend("force", config, {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
          }))
        end,
      },
    },
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
      notification = {
        view = { stack_upwards = false },
        window = { winblend = 0 },
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true,
      },
      {
        "jay-babu/mason-null-ls.nvim",
        main = "mason-null-ls",
        opts = {
          ensure_installed = {},
          automatic_installation = false,
          handlers = {},
        },
      },
    },
    main = "null-ls",
    config = true,
  },
}
