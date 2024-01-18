vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>e", vim.cmd.Explore)

local function is_qflist_empty()
  return #vim.fn.getqflist() == 0
end

vim.keymap.set("n", "<C-n>", function()
  if not is_qflist_empty() then
    if not pcall(vim.cmd.cnext) then
      vim.cmd.cfirst()
    end
  end
end)

vim.keymap.set("n", "<C-p>", function()
  if not is_qflist_empty() then
    if not pcall(vim.cmd.cprev) then
      vim.cmd.clast()
    end
  end
end)
