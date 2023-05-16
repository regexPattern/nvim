local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  "force",
  lsp_defaults.capabilities,
  require("cmp_nvim_lsp").default_capabilities()
)

vim.diagnostic.config({
  severity_sort = true,
  float = {
    border = "single",
    max_width = 80,
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "single",
    max_width = 80,
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {
    border = "single",
    max_width = 40,
  }
)

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local client = vim.lsp.get_client_by_id(args.data.client_id)

    local lsp_inlayhints_ok, lsp_inlayhints = pcall(require, "lsp-inlayhints")
    if lsp_inlayhints_ok and client.server_capabilities.inlayHintProvider then
      lsp_inlayhints.on_attach(client, args.buf)
    end
  end,
})
