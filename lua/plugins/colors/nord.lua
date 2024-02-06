return {
  "https://github.com/gbprod/nord.nvim",
  opts = {
    transparent = true,
    errors = { mode = "none" },
    styles = {
      comments = { italic = false },
    },
  },
  config = function(spec)
    require("nord").setup(spec.opts)
    vim.cmd [[ colorscheme nord ]]
  end,
}
