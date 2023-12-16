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

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if vim.snippet.jumpable(1) then
    return "<cmd>lua vim.snippet.jump(1)<CR>"
  else
    return "<Tab>"
  end
end, { expr = true })

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if vim.snippet.jumpable(-1) then
    return "<cmd>lua vim.snippet.jump(-1)<CR>"
  else
    return "<S-Tab>"
  end
end, { expr = true })
