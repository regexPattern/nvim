-- Grep
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Line and line numbers
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.wrap = false

-- Completion options
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.pumheight = 15

-- Indentation
vim.opt.expandtab = false
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.tabstop = 4

-- Other
vim.opt.list = false
vim.opt.listchars = { eol = "$", lead = ".", space = ".", tab = ">-", trail = "." }
vim.opt.mouse = "a"
vim.opt.spelllang = { "en" }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.undofile = true

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
