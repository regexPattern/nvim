vim.api.nvim_create_augroup("LspAttach_mappings", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_mappings",
  callback = function(args)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = args.buf })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = args.buf })
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = args.buf })

    -- actions
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = args.buf })
    vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { buffer = args.buf })
    vim.keymap.set("n", "<Leader>x", vim.lsp.buf.format, { buffer = args.buf })

    -- diagnostics
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { buffer = args.buf })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { buffer = args.buf })
  end,
})
