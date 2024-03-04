return {
  "NvChad/nvim-colorizer.lua",
  event = "BufWinEnter",
  opts = {
    filetypes = {
      "*",
      css = { name = true },
      cmp_docs = { always_update = true },
      cmp_menu = { always_update = true },
    },
    user_default_options = {
      names = false,
      tailwind = true,
    },
  },
}
