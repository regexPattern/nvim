local group_name = "LspAttach_mappings"
vim.api.nvim_create_augroup(group_name, {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = group_name,
  callback = function(args)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = args.buf })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = args.buf })
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = args.buf })
    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { buffer = args.buf })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { buffer = args.buf })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { buffer = args.buf })
    vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = args.buf })
    vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { buffer = args.buf })

    vim.keymap.set("n", "<Leader>wd", function()
      require("diaglist").open_all_diagnostics()
    end, { buffer = args.buf })

    -- vim.keymap.set("n", "<Leader>x", function()
    --   vim.lsp.buf.format({
    --     -- filter = function(client)
    --     --   return client.name == "null-ls"
    --     -- end,
    --     bufnr = args.buf,
    --   })
    -- end, { buffer = args.buf })
  end,
})
