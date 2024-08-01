vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.http",
  callback = function(args)
    vim.bo[args.buf].filetype = "http"
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = vim.fn.stdpath("config") .. "/*.lua",
  callback = function(args)
    vim.keymap.set("n", "<Leader>r", ":luafile %<CR>", { buffer = args.buf })
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    local winid = vim.api.nvim_get_current_win()
    vim.wo[winid].wrap = vim.api.nvim_get_option_value("filetype", {}) == "markdown"
  end,
})

-- vim.api.nvim_create_autocmd("BufLeave", {
--   pattern = "*.md",
--   callback = function()
--     local winid = vim.api.nvim_get_current_win()
--     vim.wo[winid].wrap = false
--   end,
-- })
