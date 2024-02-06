return {
  "https://github.com/nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    update_focused_file = {
      enable = true,
    },
    renderer = {
      icons = {
        show = {
          git = false,
        },
      },
    },
    on_attach = function(bufnr)
      local api = require "nvim-tree.api"
      local opts = { buffer = bufnr }

      vim.keymap.set("n", "<Space>", api.node.open.edit, opts)
      vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts)
      vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts)

      vim.keymap.set("n", "<CR>", api.fs.rename, opts)
      vim.keymap.set("n", "%", api.fs.create, opts)
      vim.keymap.set("n", "D", api.fs.remove, opts)
      vim.keymap.set("n", "H", api.tree.collapse_all, opts)
    end,
  },
  init = function()
    -- https://gitlab.com/gabmus/nvpunk/-/blob/master/lua/nvpunk/internals/context_menu.lua
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        vim.cmd [[ aunmenu PopUp ]]

        if vim.bo.filetype ~= "NvimTree" then
          return
        end

        vim.cmd [[ nmenu PopUp.Copy\ Relative\ Path <CMD>lua require("nvim-tree.api").fs.copy.relative_path()<CR> ]]
        vim.cmd [[ nmenu PopUp.Copy\ Absolute\ Path <CMD>lua require("nvim-tree.api").fs.copy.absolute_path()<CR> ]]
      end,
    })
  end,
  keys = {
    { "<D-b>", ":NvimTreeToggle<CR>" },
    { "<D-S-e>", ":NvimTreeFocus<CR>" },
  },
}
