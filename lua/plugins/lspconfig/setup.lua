vim.api.nvim_create_user_command("Format", function()
  vim.lsp.buf.format()
end, {})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then return end

    local function map(keys, cb, mode, opts)
      mode = mode or "n"
      opts = vim.tbl_deep_extend("force", opts or {}, { buffer = bufnr })
      vim.keymap.set(mode, keys, cb, opts)
    end

    map("K", vim.lsp.buf.hover)
    map("<Leader>ca", vim.lsp.buf.code_action)
    map("<Leader>rn", vim.lsp.buf.rename)
    map("<Leader>x", vim.cmd.Format)
    map("gd", vim.lsp.buf.definition)
    map("gD", vim.lsp.buf.declaration)

    -- server capabilities:
    -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities

    if client.server_capabilities.inlayHintProvider then
      map("<Leader>t", function()
        vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
      end)
    end

    if client.server_capabilities.completionProvider then
      vim.bo[bufnr].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
    end
  end,
})
