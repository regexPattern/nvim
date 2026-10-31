---@type conform.setupOpts
local opts = {
  formatters_by_ft = {
    css = { "prettierd", "oxfmt" },
    html = { "prettierd", "oxfmt" },
    java = { "spotless_maven" },
    javascript = { "prettierd", "oxfmt" },
    json = { "prettierd", "oxfmt" },
    lua = { "luafmt" },
    nix = { "alejandra" },
    python = { "black" },
    svelte = { "prettierd", "oxfmt" },
    typescript = { "prettierd", "oxfmt" }
  },
  ---@diagnostic disable-next-line: assign-type-mismatch
  default_format_opts = { lsp_format = "fallback" }
}

return opts
