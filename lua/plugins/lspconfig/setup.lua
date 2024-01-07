vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "solid",
  max_width = 80,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "solid",
  max_width = 40,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end

    local function map(mode, key, cb, extra_opts)
      local opts = vim.tbl_deep_extend("keep", extra_opts or {}, { buffer = bufnr })
      vim.keymap.set(mode, key, cb, opts)
    end

    map("n", "K", vim.lsp.buf.hover)
    map("n", "gd", vim.lsp.buf.definition)
    map("n", "gD", vim.lsp.buf.declaration)
    map("n", "gr", vim.lsp.buf.references)
    map("n", "gs", vim.lsp.buf.signature_help)
    map("n", "go", vim.lsp.buf.type_definition)
    map("n", "<Leader>rn", vim.lsp.buf.rename)
    map("n", "<Leader>ca", vim.lsp.buf.code_action)
    map("n", "<Leader>x", vim.lsp.buf.format)

    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(bufnr, false)
      map("n", "<Leader>t", function()
        vim.lsp.inlay_hint.enable(bufnr, nil)
      end)
    end

    if client.server_capabilities.completionProvider then
      vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    end
  end,
})
