return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "williamboman/mason.nvim",
        build = function()
          ---@diagnostic disable-next-line: param-type-mismatch
          pcall(vim.cmd, "MasonUpdate")
        end,
        config = true,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        config = {
          ensure_installed = {
            "lua_ls",
          },
        },
      },

      -- required if you want to have completions for json schemas for example.
      "hrsh7th/cmp-nvim-lsp",

      -- TODO: Clean these docs.
      -- optional dependencies that are not essential for the lsp experience of
      -- are specific for language-specific setups.
      --
      -- "simrat39/rust-tools.nvim",

      -- {
      --   "SmiteshP/nvim-navic",
      --   config = {
      --     icons = require("plugins.lspconfig.icons"),
      --   },
      -- },

      "b0o/SchemaStore.nvim",
      "jose-elias-alvarez/typescript.nvim",
      { "lvimuser/lsp-inlayhints.nvim", config = true },
      {
        "akinsho/flutter-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    config = function()
      -- warning: require this before setting up the servers because this
      -- overrides the lspconfig default settings that are going to be
      -- automatically set for every server.
      --
      require("plugins.lspconfig.settings")
      require("plugins.lspconfig.mappings")

      local lspconfig = require("lspconfig")
      local server_configs = require("plugins.lspconfig.server-configs")

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local opts = server_configs[server_name] or {}
          lspconfig[server_name].setup(opts)
        end,
        ["rust_analyzer"] = function()
          local rust_tools_ok, rust_tools = pcall(require, "rust-tools")
          if rust_tools_ok then
            rust_tools.setup({})
          else
            lspconfig.rust_analyzer.setup({})
          end
        end,
        ["tsserver"] = function()
          local typescript_nvim_ok, typescript_nvim = pcall(require, "typescript")
          if typescript_nvim_ok then
            typescript_nvim.setup({})
          else
            lspconfig.tsserver.setup(server_configs["tsserver"] or {})
          end
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
    dependencies = {
      {
        "jay-babu/mason-null-ls.nvim",
        dependencies = { { "williamboman/mason.nvim", config = true } },
        config = {
          ensure_installed = {
            "stylua",
          },
          automatic_installation = false,
          handlers = {},
        },
      },
    },
    config = function()
      local null_ls = require("null-ls")

      local sources = {}

      local typescript_nvim_ok = pcall(require, "typescript")
      if typescript_nvim_ok then
        table.insert(sources, require("typescript.extensions.null-ls.code-actions"))
      end

      null_ls.setup({
        sources = sources,
      })
    end,
  },
}
