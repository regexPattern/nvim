return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
      },
      "b0o/SchemaStore.nvim",
      require("plugins.lspconfig.extra").plugins,
    },
    config = function()
      require("plugins.lspconfig.setup")
      require("mason-lspconfig").setup({
        handlers = vim.tbl_deep_extend("force", {
          function(server_name)
            if server_name == "tsserver" then
              server_name = "ts_ls"
            end

            local opts = require("plugins.lspconfig.configs")[server_name] or {}
            require("lspconfig")[server_name].setup(opts)
          end,
        }, require("plugins.lspconfig.extra").handlers),
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
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
    event = "LspAttach",
    opts = {},
  },
}
