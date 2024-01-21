local mason_spec = {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  config = true,
}

return {
  {
    "https://github.com/williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        init = function()
          require "plugins.lsp.on-attach"
        end,
        dependencies = { "b0o/schemastore.nvim" },
      },
      mason_spec,
    },
    opts = {
      handlers = {
        function(server)
          local config = require("plugins.lsp.server-configs")[server] or {}
          require("lspconfig")[server].setup(config)
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
      mason_spec,
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
