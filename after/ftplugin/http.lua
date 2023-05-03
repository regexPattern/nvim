vim.keymap.set("n", "<C-Enter>", function()
  local rest_ok, rest = pcall(require, "rest-nvim")
  if rest_ok then
    rest.run()
  end
end, { buffer = true })
