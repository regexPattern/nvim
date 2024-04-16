local group = vim.api.nvim_create_augroup("markdown-line-wrap", { clear = true }),

vim.api.nvim_create_autocmd("BufEnter", {
  group = group,
  pattern = { "*.md" },
  callback = function()
    vim.opt_local.wrap = true
  end,
})

vim.api.nvim_create_autocmd("BufLeave", {
  group = group,
  pattern = { "*.md" },
  callback = function()
    vim.opt_local.wrap = false
  end,
})
