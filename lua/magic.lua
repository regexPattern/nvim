vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "css",
    "cucumber",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "lua",
    "svelte",
    "typescript",
    "typescriptreact",
  },
  callback = function(args)
    local indent_width = 2
    vim.bo[args.buf].expandtab = true
    vim.bo[args.buf].tabstop = indent_width
    vim.bo[args.buf].shiftwidth = indent_width
  end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "codecompanion",
--   callback = function(args)
--     vim.api.nvim_create_autocmd("BufEnter", {
--       buffer = args.buf,
--       callback = function(inner_args)
--         local winid = vim.fn.bufwinid(inner_args.buf)
--         vim.wo[winid].number = false
--         vim.wo[winid].relativenumber = false
--       end,
--     })
--
--     vim.api.nvim_create_autocmd("BufHidden", {
--       buffer = args.buf,
--       callback = function(inner_args)
--         local winid = vim.fn.bufwinid(inner_args.buf)
--         vim.wo[winid].number = true
--         vim.wo[winid].relativenumber = true
--       end,
--     })
--   end,
-- })
