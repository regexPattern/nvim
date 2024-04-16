vim.cmd [[ hi Normal guibg=NONE ]]

return {} --[[vim.tbl_deep_extend("force", require("plugins.colors.nord"), {
  lazy = false,
  priority = 1000,
})]]
