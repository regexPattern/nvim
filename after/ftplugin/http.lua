--[[ vim.keymap.set("n", "<Enter>", function()
  pcall(function()
    require("rest-nvim").run()
  end)
end, { buffer = true }) ]]
