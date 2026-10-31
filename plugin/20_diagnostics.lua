Config.later(function ()
  vim.diagnostic.config({
    jump = { on_jump = vim.diagnostic.open_float },
    virtual_lines = false,
    virtual_text = false,
    severity_sort = true
  })
end)
