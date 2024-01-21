return {
  "https://github.com/echasnovski/mini.completion",
  event = "InsertEnter",
  main = "mini.completion",
  init = function()
    vim.keymap.set("i", "<Tab>", function()
      if vim.fn.pumvisible() ~= 0 then
        return "<C-y>"
      else
        return "<Tab>"
      end
    end, { expr = true })
  end,
  opts = {
    lsp_completion = {
      source_func = "omnifunc",
      auto_setup = false,
    },
  },
}
