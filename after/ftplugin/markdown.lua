vim.opt_local.spell = true
vim.opt_local.wrap = true

vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { buffer = true, expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { buffer = true, expr = true, silent = true })
