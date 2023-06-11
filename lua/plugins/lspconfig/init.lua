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

      local server_configs = require("plugins.lspconfig.server_configs")

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local opts = server_configs[server_name] or {}
          require("lspconfig")[server_name].setup(opts)
        end,
      })
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
    "mhartington/formatter.nvim",
    cmd = "Format",
    config = function()
      require("formatter").setup({
        filetype = {
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
          html = {
            require("formatter.filetypes.html").prettier,
          },
          css = {
            require("formatter.filetypes.css").prettier,
          },
          svelte = {
            require("formatter.filetypes.svelte").prettier,
          },
          json = {
            require("formatter.filetypes.json").prettierd,
          },
          jsonc = {
            require("formatter.filetypes.json").prettierd,
          },
          javascript = {
            require("formatter.filetypes.javascript").prettier,
          },
          typescript = {
            require("formatter.filetypes.typescript").prettier,
          },
        },
      })
    end,
    keys = {
      { "<Leader>x", ":Format<CR>", silent = true },
    },
  },
  {
    "onsails/diaglist.nvim",
    event = "LspAttach",
    config = function()
      require("diaglist").init({})
    end,
  },
}
