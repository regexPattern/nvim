vim.diagnostic.config {
  severity_sort = true,
  float = {
    border = "solid",
    max_width = 80,
  },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "solid",
  max_width = 80,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "solid",
  max_width = 40,
})

local colorscheme = require "plugins.colors.ayu"

return vim.tbl_extend("force", colorscheme, {
  lazy = false,
  priority = 1000,
})
