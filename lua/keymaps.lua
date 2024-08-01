vim.g.mapleader = " "

vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)

vim.keymap.set("n", "<C-Right>", ":vertical resize +5<CR>", { silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -5<CR>", { silent = true })
vim.keymap.set("n", "<C-Up>", ":resize +5<CR>", { silent = true })
vim.keymap.set("n", "<C-Down>", ":resize -5<CR>", { silent = true })

-- TODO
-- vim.keymap.set("v", "<Leader>yy", function()
--   local line_start = vim.fn.getpos("'<")[2]
--   local line_end = vim.fn.getpos("'>")[2]
--   local lines = vim.fn.getline(line_start, line_end)
--   if type(lines) == "string" then
--     print(lines)
--   else
--     for _, line in pairs(lines) do
--       print(line)
--     end
--   end
-- end, { silent = false })
