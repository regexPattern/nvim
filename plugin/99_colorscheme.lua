local heading_foreground

Config.new_autocmd("ColorScheme", "minispring", function ()
  heading_foreground = vim.api.nvim_get_hl(0, { name = "Normal", link = false }).bg
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

Config.new_autocmd("ColorScheme", "*", function ()
  local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
  for level = 1, 6 do
    local heading = vim.api.nvim_get_hl(0, { name = "@markup.heading." .. level .. ".markdown", link = false })
    vim.api.nvim_set_hl(0, "MarkdownHeading" .. level, {
      fg = normal.bg or heading_foreground or 0x000000,
      bg = heading.fg or normal.fg,
      bold = true,
    })
  end
end, "Uniform Markdown heading backgrounds"
)

Config.now(function ()
  vim.pack.add({ "https://github.com/nvim-mini/mini.hues" })
  vim.cmd.colorscheme("minispring")
end)
