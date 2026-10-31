Config.now_if_args(function ()
  vim.pack.add({
    "https://github.com/j-hui/fidget.nvim",
    "https://github.com/neovim/nvim-lspconfig"
  })

  require("fidget").setup({
    notification = {
      window = { winblend = 0 }
    }
  })

  local servers = {
    astro = "astro-ls",
    basedpyright = "basedpyright-langserver",
    cssls = "vscode-css-language-server",
    emmylua_ls = "emmylua_ls",
    golangci_lint_ls = "golangci-lint-langserver",
    gopls = "gopls",
    jdtls = "jdtls",
    jsonls = "vscode-json-language-server",
    rust_analyzer = "rust-analyzer",
    svelte = "svelteserver",
    tailwindcss = "tailwindcss-language-server",
    vtsls = "vtsls"
  }

  local function custom_on_attach(client, bufnr)
    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    if client:supports_method("textDocument/hover") then
      vim.keymap.set("n", "K", function ()
        vim.lsp.buf.hover({ border = "single", max_width = 100 })
      end, { buffer = bufnr }
      )
    end

    if client:supports_method("textDocument/inlayHint") then
      vim.keymap.set("n", "gti", function ()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { buffer = bufnr }
      )
    end

    if client:supports_method("textDocument/documentColor") then
      vim.lsp.document_color.enable(true, {}, { style = "background" })
    end
  end

  vim.lsp.handlers["client/registerCapability"] = (function (overridden)
    return function (err, res, ctx)
      local result = overridden(err, res, ctx)
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      if not client then
        return
      end
      for bufnr, _ in pairs(client.attached_buffers) do
        custom_on_attach(client, bufnr)
      end
      return result
    end
  end)(vim.lsp.handlers["client/registerCapability"])

  Config.new_autocmd("LspAttach", nil, function (ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end
    custom_on_attach(client, ev.buf)
  end, "Configure attached language servers"
  )

  for server, binary in pairs(servers) do
    if vim.fn.executable(binary) == 1 then
      vim.lsp.enable(server)
    end
  end
end)
