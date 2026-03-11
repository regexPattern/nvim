vim.keymap.set("n", "<Leader>nu", function()
  vim.wo.number = not vim.wo.number
  if not vim.wo.number and vim.wo.relativenumber then
    vim.wo.relativenumber = false
  end
end)

vim.keymap.set("n", "<Leader>rnu", function()
  vim.wo.relativenumber = not vim.wo.relativenumber
  if not vim.wo.relativenumber and vim.wo.number then
    vim.wo.number = false
  end
end)
