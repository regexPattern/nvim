vim.api.nvim_create_autocmd("BufEnter", {
  pattern = {
    "*.html",
    "*.*css",
    "*.js*",
    "*.ts*",
    "*.json*",
    "*.svelte",
    "*.lua",
  },
  callback = function()
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
})
