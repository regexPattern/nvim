function Statusline_bufname()
	local output
	local bufname = vim.fn.bufname("%")
	if vim.bo.buftype == "" and bufname ~= "" then
		output = vim.fn.expand("%:.")
	else
		output = bufname == "" and "[No Name]" or vim.fn.expand("%:t")
	end
	return output
end

vim.opt.statusline = ""
vim.opt.statusline:append([[%<%{%v:lua.Statusline_bufname()%}]])
vim.opt.statusline:append([[ ]])
vim.opt.statusline:append([[%h%w%m%r]])
vim.opt.statusline:append([[%=]])
vim.opt.statusline:append([[%-14.(%l,%c%V%) %P]])
