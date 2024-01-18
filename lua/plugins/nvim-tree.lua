return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    update_focused_file = {
      enable = false,
    },
    on_attach = function(bufnr)
      local api = require "nvim-tree.api"
      local opts = { buffer = bufnr, silent = true }

      vim.keymap.set("n", "R", api.fs.rename, opts)
      vim.keymap.set("n", "<CR>", api.node.open.edit, opts)
      vim.keymap.set("n", "%", api.fs.create, opts)
      vim.keymap.set("n", "D", api.fs.remove, opts)
      vim.keymap.set("n", "H", api.tree.collapse_all, opts)
    end,
  },
  init = function()
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
  end,
  keys = {
    { "<Leader>E", ":NvimTreeToggle<CR>", silent = true },
  },
}
