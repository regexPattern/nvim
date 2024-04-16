return {
  "gbprod/nord.nvim",
  config = function()
    require("nord").setup({
      transparent = true,
    })

    vim.cmd [[ colo nord ]]
  end,
}
