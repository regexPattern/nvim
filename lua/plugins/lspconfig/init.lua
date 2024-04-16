return {
  {
    "williamboman/mason.nvim",
    name = "mason",
    config = true,
  },
  {
    "neovim/nvim-lspconfig",
    enabled = not vim.fn.exists("minimal"),
    event = "BufReadPost",
    dependencies = {
      "mason",
      { "williamboman/mason-lspconfig.nvim", config = true },
      "b0o/SchemaStore.nvim",
    },
    init = function()
      require("plugins.lspconfig.setup")
    end,
    config = function()
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local config = require("plugins.lspconfig.server-configs")[server_name] or {}
          require("lspconfig")[server_name].setup(vim.tbl_deep_extend("force", config, {}))
        end,
      })
    end,
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
    "stevearc/conform.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "mason", "zapling/mason-conform.nvim" },
    config = function()
      require("conform").setup()
      require("mason-conform").setup()
    end,
  },
}
