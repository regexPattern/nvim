return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    enabled = not vim.g.minimal,
    dependencies = {
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        config = true,
      },
      "hrsh7th/cmp-nvim-lsp",
      "b0o/SchemaStore.nvim",
      {
        "lvimuser/lsp-inlayhints.nvim",
        config = {
          enabled_at_startup = true,
        },
      },
      {
        "akinsho/flutter-tools.nvim",
        enabled = false,
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    config = function()
      require("plugins.lspconfig.handlers")
      require("plugins.lspconfig.mappings")

      local server_configs = require("plugins.lspconfig.server_configs")

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local opts = server_configs[server_name] or {}
          require("lspconfig")[server_name].setup(opts)
        end,
      })

      local flutter_tools_ok, flutter_tools = pcall(require, "flutter-tools")
      if flutter_tools_ok then
        flutter_tools.setup({})
      end
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = {
      fmt = { stack_upwards = false },
      window = { blend = 0 },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettierd.with({ extra_filetypes = { "svelte" } }),
          null_ls.builtins.formatting.rustfmt,
          null_ls.builtins.formatting.stylua,
        },
      })
    end,
  },
}
