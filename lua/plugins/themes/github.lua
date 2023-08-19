return {
  "projekt0n/github-nvim-theme",
  config = function()
    require("github-theme").setup()

    vim.cmd([[ colo github_dark ]])
  end,
}
