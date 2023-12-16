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
    vim.defer_fn(function()
      -- stylua: ignore
      vim.cmd.colorscheme(vim.o.background == "dark"
        and "github_dark_high_contrast"
        or "github_light_high_contrast")
    end, 0)
  end,
}
