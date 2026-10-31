vim.opt.undofile = true

vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.winborder = "solid"
vim.opt.wrap = false

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.shiftwidth = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.scrolloff = 5

vim.opt.completetimeout = 100

vim.opt.cmdheight = 1

-- UI2 needs an attached UI; do not enable it in headless sessions.
Config.new_autocmd("UIEnter", nil, function ()
  require("vim._core.ui2").enable({
    enable = true,
    msg = {
      targets = "cmd",
      dialog = {
        height = 0.5
      },
      msg = {
        height = 0.5
      },
      pager = {
        height = 0.999
      }
    }
  })
  return true -- Remove the autocommand after the first UI attaches.
end, "Enable experimental message UI"
)
