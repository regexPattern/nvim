local web_filetypes = {
  "*.html",
  "*.*css",
  "*.js*",
  "*.ts*",
  "*.json*",
  "*.svelte",
}

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.lua", unpack(web_filetypes) },
  callback = function()
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md" },
  callback = function()
    vim.wo.spell = true
    vim.wo.wrap = true

    vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { buffer = true, expr = true, silent = true })
    vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { buffer = true, expr = true, silent = true })
  end,
})
