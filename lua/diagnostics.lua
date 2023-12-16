vim.diagnostic.config {
  severity_sort = true,
  float = {
    border = "solid",
    max_width = 80,
  },
}

vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { silent = true })
