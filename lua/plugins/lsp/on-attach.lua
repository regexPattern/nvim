vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end

    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(0, false)
    end

    if client.server_capabilities.completionProvider then
      vim.bo.omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
    end
  end,
})
