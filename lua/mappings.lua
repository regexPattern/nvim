vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>e", vim.cmd.Explore)

vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)

local function is_qflist_empty()
  return #vim.fn.getqflist() == 0
end

vim.keymap.set("n", "<C-n>", function()
  if not is_qflist_empty() then
    if not pcall(vim.cmd.cnext) then
      vim.cmd.cfirst()
    end
  end
end)

vim.keymap.set("n", "<C-p>", function()
  if not is_qflist_empty() then
    if not pcall(vim.cmd.cprev) then
      vim.cmd.clast()
    end
  end
end)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end

    local function map(mode, key, cb, extra_opts)
      local opts = vim.tbl_deep_extend("keep", extra_opts or {}, { buffer = true })
      vim.keymap.set(mode, key, cb, opts)
    end

    map("n", "K", vim.lsp.buf.hover)
    map("n", "gd", vim.lsp.buf.definition)
    map("n", "gD", vim.lsp.buf.declaration)
    map("n", "gr", vim.lsp.buf.references)
    map("n", "gs", vim.lsp.buf.signature_help)
    map("n", "<Leader>rn", vim.lsp.buf.rename)
    map("n", "<Leader>ca", vim.lsp.buf.code_action)
    map("n", "<Leader>x", vim.lsp.buf.format)

    if client.server_capabilities.inlayHintProvider then
      map("n", "<Leader>t", function()
        local hints_enabled = vim.lsp.inlay_hint.is_enabled(0)
        vim.lsp.inlay_hint.enable(0, not hints_enabled)
      end)
    end
  end,
})
