return {
  "projekt0n/github-nvim-theme",
  opts = {
    options = {
      hide_end_of_buffer = false,
      hide_nc_statusline = false,
      transparent = true,
    },
    groups = {
      github_light_high_contrast = {
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
