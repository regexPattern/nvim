return {
  plugins = {
    -- {
    --   "nvim-java/nvim-java",
    --   opts = {
    --     spring_boot_tools = { enable = false },
    --     jdk = { auto_install = false },
    --   },
    -- },
  },
  handlers = {
    ["jdtls"] = nil, -- function()
    --   require("lspconfig")["jdtls"].setup({
    --     on_attach = function()
    --       vim.keymap.set("n", "<Leader>tc", ":JavaTestRunCurrentClass<CR>", { buffer = true })
    --       vim.keymap.set("n", "<Leader>tm", ":JavaTestRunCurrentMethod<CR>", { buffer = true })
    --       vim.keymap.set("n", "<Leader>tr", ":JavaTestViewLastReport<CR>", { buffer = true })
    --     end,
    --   })
    -- end,
  },
}
