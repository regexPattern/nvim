vim.g.mapleader = " "

-- Netrw
vim.keymap.set("n", "<Leader>e", ":Explore<CR>", { silent = true })

-- Quickfix and location lists
vim.keymap.set("n", "<C-j>", ":cnext<CR>")
vim.keymap.set("n", "<C-k>", ":cprev<CR>")
vim.keymap.set("n", "<M-j>", ":lnext<CR>")
vim.keymap.set("n", "<M-k>", ":lprev<CR>")

-- Window management
vim.keymap.set("n", "<C-Up>", ":res +2<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":res -2<CR>", { silent = true })
vim.keymap.set("n", "<C-Right>", ":vert res +2<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vert res -2<CR>", { silent = true })

-- Add undo breakpoints
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")
