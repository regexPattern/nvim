vim.api.nvim_create_user_command("ToggleInlayHints", function()
	require("lsp-inlayhints").toggle(0)
end, {})

vim.api.nvim_create_user_command("CopyPathToClip", function()
	vim.fn.setreg("+", vim.fn.expand("%:."))
end, {})
