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
    },
    config = function()
      require("plugins.lspconfig.handlers")
      require("plugins.lspconfig.mappings")

      local lspconfig = require("lspconfig")
      local server_configs = require("plugins.lspconfig.server_configs")

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local opts = server_configs[server_name] or {}
          lspconfig[server_name].setup(opts)
        end,
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    config = {
      fmt = { stack_upwards = false },
      window = { blend = 0 },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettierd.with({ extra_filetypes = { "svelte" } }),
          -- null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.rustfmt,
          null_ls.builtins.formatting.stylua,
        },
      })
    end,
  },
  --[[ {
    "onsails/diaglist.nvim",
    event = "LspAttach",
    config = function()
      require("diaglist").init({})
    end,
  }, ]]
}
