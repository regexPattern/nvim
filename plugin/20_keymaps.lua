vim.keymap.set("n", "gK", function ()
  vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
end, { desc = "Toggle diagnostic lines" }
)

vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory" })

for key, picker in pairs({
  ["<Leader>ff"] = "files",
  ["<Leader><C-^>"] = "resume",
  ["<Leader>ud"] = "undotree",
  ["z="] = "spell_suggest"
}) do
  vim.keymap.set("n", key, function ()
    require("fzf-lua")[picker]()
  end, { desc = "Fzf: " .. picker }
  )
end

vim.keymap.set({ "n", "x" }, "<Leader>x", function ()
  if not require("conform").format({ async = false }) then
    vim.cmd([[norm mqHmwgg=G`wzt`q]])
  end
end, { desc = "Format buffer or selection" }
)
