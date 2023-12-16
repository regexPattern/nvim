local web_filetypes = {
  "*.html",
  "*.*css",
  "*.js*",
  "*.ts*",
  "*.json*",
  "*.svelte",
}

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = vim.tbl_deep_extend("force", web_filetypes, {
    "*.lua",
  }),
  callback = function()
    vim.bo.expandtab = true
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md" },
  callback = function()
    vim.wo.spell = true
    vim.wo.wrap = true

    vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { buffer = true, expr = true, silent = true })
    vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { buffer = true, expr = true, silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "NvimTree" },
  callback = function(args)
    local nvim_tree_api = require "nvim-tree.api"

    vim.api.nvim_buf_create_user_command(args.buf, "CopyAbsolutePath", function()
      local node = nvim_tree_api.tree.get_node_under_cursor()
      nvim_tree_api.fs.copy.absolute_path(node)
    end, {})

    vim.api.nvim_buf_create_user_command(args.buf, "CopyRelativePath", function()
      local node = nvim_tree_api.tree.get_node_under_cursor()
      nvim_tree_api.fs.copy.relative_path(node)
    end, {})
  end,
})

vim.api.nvim_create_autocmd("CompleteDone", {
  pattern = "*",
  callback = function()
    if vim.fn.pumvisible() == 0 then
      vim.cmd.pclose()
    end
  end,
})

vim.cmd [[
aunmenu   PopUp
vnoremenu PopUp.Copy "+y
vnoremenu PopUp.Cut  "+x
]]
