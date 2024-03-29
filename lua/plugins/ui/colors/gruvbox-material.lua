return {
  "https://github.com/sainnhe/gruvbox-material",
  config = function()
    vim.cmd [[ colorscheme gruvbox-material ]]
  end,
  init = function()
    vim.g.gruvbox_material_background = "medium"
    vim.g.gruvbox_material_foreground = "medium"
    vim.g.gruvbox_material_disable_italic_comment = 1
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_enable_italic = 0
    vim.g.gruvbox_material_transparent_background = 1
    vim.g.gruvbox_material_better_performance = 1
  end,
}
