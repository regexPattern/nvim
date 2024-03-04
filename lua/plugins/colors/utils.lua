local M = {}

function M.set_handlers_borders(style)
  vim.diagnostic.config {
    float = { border = style }
  }

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, { border = style }
  )

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, { border = style }
  )
end

return M
