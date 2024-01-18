return {
  "projekt0n/github-nvim-theme",
  build = ":GithubThemeCompile",
  opts = {
    options = {
      hide_end_of_buffer = false,
      hide_nc_statusline = false,
      transparent = true,
    },
    groups = {
      github_light_high_contrast = {
        CmpDocumentation = { bg = "#e7ecf0" },
        FloatBorder = { bg = "#e7ecf0" },
        NormalFloat = { bg = "#e7ecf0" },
        Pmenu = { bg = "#e7ecf0" },
        StatusLine = { bg = "#e7ecf0" },
        StatusLineNC = { bg = "#e7ecf0" },
      },
    },
  },
  config = function(spec)
    require("github-theme").setup(spec.opts)
    vim.cmd.colorscheme "github_light_high_contrast"
  end,
}
