local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config

-- populate default capabilities with autocompletion capabilities that are
-- going to be used by all the servers. only if `cmp` is installed.
--
local cmp_ok, cmp = pcall(require, "cmp_nvim_lsp")

if cmp_ok then
  lsp_defaults.capabilities = vim.tbl_deep_extend(
    "force",
    lsp_defaults.capabilities,
    cmp.default_capabilities()
  )
end

-- handlers
--
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

-- common on_attach hook for all language servers. mappings are not define in
-- this specific autocommand but in another one for the same event located at
-- `lua/plugins/lspconfig/mappings.lua`.
--
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

    local navic_ok, navic = pcall(require, "nvim-navic")
    if navic_ok and client.server_capabilities.documentSymbolProvider then
      navic.attach(client, args.buf)
      vim.o.winbar = "%{substitute(expand('%f'), '/', ' > ', 'g')} %{%v:lua.require'nvim-navic'.get_location()%}"
    end
  end,
})