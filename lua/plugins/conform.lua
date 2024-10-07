local function add_webdev_formatter(others)
  local webdev_fts = { "css", "html", "javascript", "json", "typescript" }
  local webdev_fts_with_prettierd = {}
  for _, ft in ipairs(webdev_fts) do
    webdev_fts_with_prettierd[ft] = { "prettierd" }
  end
  return vim.tbl_deep_extend("force", webdev_fts_with_prettierd, others)
end

return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = add_webdev_formatter({
      go = { "goimports", "gofmt" },
      lua = { "stylua" },
      sql = { "pg_format" },
    }),
  },
  init = function()
    vim.api.nvim_create_user_command("Format", function()
      require("conform").format({
        lsp_format = "fallback",
      })
    end, {})
  end,
  keys = {
    { "<leader>x", ":Format<CR>" },
  },
}
