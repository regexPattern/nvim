return {
  "https://github.com/projekt0n/github-nvim-theme",
  build = ":GithubThemeCompile",
  opts = {
    options = {
      hide_end_of_buffer = false,
      hide_nc_statusline = false,
      transparent = true,
    },
    groups = {
      github_light_high_contrast = {
        FloatBorder = { bg = "#e7ecf0" },
        NormalFloat = { bg = "#e7ecf0" },
        Pmenu = { bg = "#e7ecf0" },

        -- Statusline
        StatusLine = { bg = "#e7ecf0" },
        StatusLineNC = { bg = "#e7ecf0" },
      },
    },
  },
  config = function(spec)
    require("github-theme").setup(spec.opts)

    vim.cmd [[ colorscheme github_light_high_contrast ]]

    -- local diagnostic_groups = {
    --   "DiagnosticUnderlineError",
    --   "DiagnosticUnderlineWarn",
    --   "DiagnosticUnderlineInfo",
    --   "DiagnosticUnderlineHint",
    --   "DiagnosticUnderlineOk",
    -- }

    -- for _, group in ipairs(diagnostic_groups) do
    --   vim.cmd("highlight " .. group .. " gui=undercurl")
    -- end

    -- vim.cmd [[ highlight NetrwSpecialFiles gui=bold,underline ]]
  end,
}
