vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>e", ":Explore<CR>", { silent = true })

vim.keymap.set("n", "<C-j>", ":cnext<CR>")
vim.keymap.set("n", "<C-k>", ":cprev<CR>")
