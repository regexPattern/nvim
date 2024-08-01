vim.api.nvim_create_user_command("Format", function()
  require("conform").format({ lsp_format = "fallback" })
end, {})

return {
  "stevearc/conform.nvim",
  enabled = not vim.g.minimal,
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      css = { "prettierd" },
      go = { "goimports", "gofmt" },
      html = { "prettierd" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      json = { "prettierd" },
      lua = { "stylua" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      sql = { "pg_format" },
    },
  },
  keys = {
    { "<Leader>x", ":Format<CR>" },
  },
}
