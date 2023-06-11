vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.expandtab = false -- Use tabs instead of spaces
vim.opt.grepformat = "%f:%l:%c:%m" -- Process `rg --vimgrep` output format
vim.opt.grepprg = "rg --vimgrep" -- Use ripgrep as grep command
vim.opt.hlsearch = true -- Highlight items in the search stack
vim.opt.ignorecase = true -- Ignore case when using patterns
vim.opt.inccommand = "nosplit" -- Show live preview of `:s` in same window
vim.opt.list = false -- Show some invisible characters (tabs...
vim.opt.listchars = { eol = "$", lead = ".", space = ".", tab = ">-", trail = "." }
vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.number = true -- Print line number
vim.opt.numberwidth = 4 -- Minimum width of the line numbers column
vim.opt.pumheight = 15 -- Maximum number of entries in a popup
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.scrolloff = 5 -- Lines of context
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.sidescrolloff = 8 -- Like scrolloff, but for horizontal scroll
vim.opt.smartcase = true -- Activate `ignorecase` smartly
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.spelllang = { "en" }
vim.opt.splitbelow = true -- New horizontal window splits bellow the current one
vim.opt.splitright = true -- New vertical window splits to the right of the current one
vim.opt.swapfile = false -- Don't use a swapfile
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.termguicolors = true -- True color support
vim.opt.undofile = true -- Keep track of file changes stack even after deleting the buffer
vim.opt.wrap = false -- Don't wrap lines that are too long

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
