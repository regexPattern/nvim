vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then
      return
    end

    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
      vim.keymap.set("n", "<Leader>ti", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
      end)
    end

    -- vim.bo[bufnr].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action)
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
  end
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "single",
    max_width = 80,
    max_height = 20,
  }
)
