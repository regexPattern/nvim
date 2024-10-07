vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>e", ":Explore<CR>", { silent = true })

vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)

vim.keymap.set("n", "<C-Right>", ":vertical resize +5<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -5<CR>", { silent = true })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { silent = true })

vim.keymap.set("n", "<C-j>", function()
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    return ":try | cnext | catch | cfirst | catch | endtry<CR>"
  else
    return "<C-j>"
  end
end, { expr = true, silent = true })

vim.keymap.set("n", "<C-k>", function()
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    return ":try | cprev | catch | cfirst | catch | endtry<CR>"
  else
    return "<C-k>"
  end
end, { expr = true, silent = true })
