Config.new_autocmd("ColorScheme", "minispring", function ()
  for _, group in ipairs({
    "Normal",
    "NormalNC",
    "SignColumn",
    "FoldColumn",
    "EndOfBuffer"
  }) do
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    hl.bg, hl.ctermbg = nil, nil
    vim.api.nvim_set_hl(0, group, hl)
  end
end, "Transparent minispring backgrounds"
)

Config.now(function ()
  vim.pack.add({ "https://github.com/nvim-mini/mini.hues" })
  vim.cmd.colorscheme("minispring")
end)
