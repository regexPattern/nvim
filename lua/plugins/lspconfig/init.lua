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
      "hrsh7th/cmp-nvim-lsp",

      -- OPTIONAL: plugins you can enable or disable as you like.
      --
      { "b0o/SchemaStore.nvim", enabled = true },
      { "jose-elias-alvarez/typescript.nvim", enabled = false },
      { "simrat39/rust-tools.nvim", enabled = false },
      {
        "SmiteshP/nvim-navic",
        enabled = false,
        config = {
          icons = require("plugins.lspconfig.icons"),
        },
      },
      {
        "lvimuser/lsp-inlayhints.nvim",
        enabled = true,
        config = true,
      },
      {
        "akinsho/flutter-tools.nvim",
        enabled = false,
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    config = function()
      -- WARNING: require this before setting up the servers because this
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
            rust_tools.setup({
              tools = {
                inlay_hints = {
                  -- if `lsp-inlayhints` is available, use that plugin to
                  -- provide inlay hints instead.
                  auto = not pcall(require, "lsp-inlayhints"),
                },
              },
            })
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
