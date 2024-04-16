return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    update_focused_file = {
      enable = true,
    },
    renderer = {
      icons = {
        padding = " ",
        show = {
          git = false,
        },
      },
    },
  },
  keys = {
    { "<Leader>E", ":NvimTreeToggle<CR>" },
  },
}
