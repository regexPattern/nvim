-- signcolumn
vim.o.number         = true
vim.o.relativenumber = true
vim.o.signcolumn = "auto"

-- indent
vim.o.autoindent = true
vim.o.expandtab  = false
vim.o.scrolloff  = 5
vim.o.shiftwidth = 4
vim.o.tabstop    = 4
vim.o.wrap       = false
vim.opt.indentkeys:remove({":"})

-- search
vim.o.hlsearch   = true
vim.o.ignorecase = true
vim.o.incsearch  = true
vim.o.smartcase  = true

-- windows
vim.o.splitbelow = true
vim.o.splitright = true

-- gui
vim.o.mouse         = "a"
vim.o.termguicolors = true

-- general
vim.o.backup    = false
vim.o.spelllang = "en_us"
vim.o.swapfile  = false
vim.o.undofile  = true
