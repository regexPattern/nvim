local function disable_semantic_tokens(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil

  if type(bufnr) == "number" and vim.lsp.semantic_tokens then
    vim.lsp.semantic_tokens.enable(false, { bufnr = bufnr, client_id = client.id })
  end
end

return {
  on_init = disable_semantic_tokens,
  on_attach = disable_semantic_tokens,
  settings = {
    vtsls = { autoUseWorkspaceTsdk = true },
    typescript = {
      preferGoToSourceDefinition = true,
      updateImportsOnFileMove = { enabled = "always" },
      suggest = {
        completeFunctionCalls = true
      },
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true
      }
    },
    javascript = {
      preferGoToSourceDefinition = true,
      updateImportsOnFileMove = { enabled = "always" },
      suggest = {
        completeFunctionCalls = true
      },
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true
      }
    }
  }
}
