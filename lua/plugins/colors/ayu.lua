return {
  "Shatur/neovim-ayu",
  config = function()
    require("ayu").setup({
      overrides = {
        Normal = { bg = "None" },
        ColorColumn = { bg = "None" },
        SignColumn = { bg = "None" },
        Folded = { bg = "None" },
        FoldColumn = { bg = "None" },
        CursorLine = { bg = "None" },
        CursorColumn = { bg = "None" },
        WhichKeyFloat = { bg = "None" },
        VertSplit = { bg = "None" },
        StatusLine = { bg = "#313337" },
        StatusLineNC = { bg = "#313337" },
        WinSeparator = { fg = "#3F4043" },
      }
    })

    vim.cmd [[ colo ayu ]]

    require("plugins.colors.utils").set_handlers_borders("single")
  end,
}
