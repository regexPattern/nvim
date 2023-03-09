vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>e", ":Explore<CR>")

-- system clipboard registers
vim.keymap.set({ "n", "x" }, "<Leader>y", '"+y')
vim.keymap.set("n", "<Leader>p", '"+p')

-- window resizing
vim.keymap.set("n", "<C-Up>", ":res +2<CR>")
vim.keymap.set("n", "<C-Down>", ":res -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vert res +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vert res -2<CR>")

-- navigate quickfix list
vim.keymap.set("n", "<C-j>", ":cnext<CR>")
vim.keymap.set("n", "<C-k>", ":cprev<CR>")

-- reindent the entire file
-- this is meant to be overwritten when a lsp server attaches to the buffer, so
-- an actual code formatter runs if there is one available.
-- see: `lua/plugins/lspconfig.lua`
--
_G.format_key =  "<Leader>x"
vim.keymap.set("n", _G.format_key, "gg=G<C-o>")

-- custom commands
-- see: `lua/nvim-magic.lua`
--
vim.keymap.set("n", "<Leader>R", ":Reload<CR>")
