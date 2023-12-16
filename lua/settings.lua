-- Neovim core settings, independent from any plugin.

-- Indentation
vim.opt.expandtab = false
vim.opt.formatoptions = "jcrql"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- User Interface
vim.opt.cmdheight = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false

-- Completion
vim.opt.pumheight = 15
vim.opt.completeopt = "menuone,preview"

-- Scrolling
vim.opt.cursorline = true
vim.opt.scrolloff = 5

-- Search
vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.hlsearch = true
vim.opt.ignorecase = true

-- General
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.undofile = true
