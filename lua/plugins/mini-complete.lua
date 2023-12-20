return {
  "echasnovski/mini.completion",
  main = "mini.completion",
  opts = {
    set_vim_settings = false,
  },
  init = function()
    vim.opt.pumheight = 15
  end,
}
