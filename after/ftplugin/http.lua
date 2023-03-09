vim.keymap.set("n", "<Enter>", function()
  require("rest-nvim").run()
end, { buffer = true })
