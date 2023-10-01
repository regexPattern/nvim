vim.g.mapleader = " "

-- Open Netrw
vim.keymap.set("n", "<Leader>e", ":Explore<CR>", { silent = true })

-- Jump through Quickfix list items
vim.keymap.set("n", "<C-j>", ":cnext<CR>")
vim.keymap.set("n", "<C-k>", ":cprev<CR>")

-- Window resizing
vim.keymap.set("n", "<M-Up>", ":res +2<CR>", { silent = true })
vim.keymap.set("n", "<M-Down>", ":res -2<CR>", { silent = true })
vim.keymap.set("n", "<M-Right>", ":vert res +2<CR>", { silent = true })
vim.keymap.set("n", "<M-Left>", ":vert res -2<CR>", { silent = true })

-- Add undo breakpoints
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")
