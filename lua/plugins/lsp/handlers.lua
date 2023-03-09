vim.diagnostic.config {
	float            = { border = "single" },
	severity_sort    = true,
	underline        = true,
	update_in_insert = false,
	virtual_text     = { underline = true },
}

vim.lsp.handlers["textDocument/hover"] =
vim.lsp.with(vim.lsp.handlers.hover, {
	border     = "single",
	focusable  = true,
	max_height = 30,
})

vim.lsp.handlers["textDocument/signatureHelp"] =
vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "single",
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		-- client.server_capabilities.semanticTokensProvider = nil

		if client.name == "tsserver" then
			client.server_capabilities.documentFormattingProvider = false
		end

		vim.keymap.set("n", "K",          vim.lsp.buf.hover,           { buffer = bufnr })
		vim.keymap.set("n", "gd",         vim.lsp.buf.definition,      { buffer = bufnr })
		vim.keymap.set("n", "gD",         vim.lsp.buf.declaration,     { buffer = bufnr })
		vim.keymap.set("n", "gT",         vim.lsp.buf.type_definition, { buffer = bufnr })
		vim.keymap.set("n", "gi",         vim.lsp.buf.implementation,  { buffer = bufnr })
		vim.keymap.set("n", "go",         vim.lsp.buf.type_definition, { buffer = bufnr })
		vim.keymap.set("n", "gr",         vim.lsp.buf.references,      { buffer = bufnr })
		vim.keymap.set("n", "gs",         vim.lsp.buf.signature_help,  { buffer = bufnr })
		vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename,          { buffer = bufnr })
		vim.keymap.set("n", "<C-.>",      vim.lsp.buf.code_action,     { buffer = bufnr })
		vim.keymap.set("n", "[d",         vim.diagnostic.goto_next,    { buffer = bufnr })
		vim.keymap.set("n", "]d",         vim.diagnostic.goto_prev,    { buffer = bufnr })

		vim.keymap.set("n", "<Leader>x",  function()
			vim.lsp.buf.format({ async = true })
		end, { buffer = bufnr })

		require("lsp-inlayhints").on_attach(client, bufnr)

		-- vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr(#{timeout_ms:250})")
	end,
})
