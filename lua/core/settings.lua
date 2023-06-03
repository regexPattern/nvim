-- Indentation
vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Lines
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.wrap = false
vim.opt.scrolloff = 5

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- List
vim.opt.list = false
vim.opt.listchars = {
  eol = "$",
  lead = ".",
  space = ".",
  tab = ">-",
  trail = ".",
}

-- Other
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.spelllang = "en,es"
