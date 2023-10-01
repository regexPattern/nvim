return {
  {
    "neovim/nvim-lspconfig",
    version = false,
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
    },
    config = function()
      require("plugins.lspconfig.handlers")

      local lspconfig = require("lspconfig")
      local server_configs = require("plugins.lspconfig.server_configs")

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local opts = server_configs[server_name] or {}

          lspconfig[server_name].setup(vim.tbl_deep_extend("force", opts, {
            on_attach = function(client, bufnr)
              vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
              vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
              vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
              vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
              vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = bufnr })
              vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { buffer = bufnr })
              vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { buffer = bufnr })
              vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { buffer = bufnr })
              vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
              vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })

              if client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint(bufnr, true)
              end
            end,
          }))
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
    "stevearc/conform.nvim",
    event = "LspAttach",
    init = function()
      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({
          async = true,
          lsp_fallback = true,
          range = range,
        })
      end, { range = true })
    end,
    config = function()
      local formatters = {}

      -- Use `prettierd` for most web development related filetypes
      for _, filetype in pairs(require("core.utils").web_dev_filetypes) do
        formatters[filetype] = { "prettierd" }
      end

      require("conform").setup({
        formatters_by_ft = formatters,
      })
    end,
    keys = {
      { "<Leader>x", ":Format<CR>" },
    },
  },
}
