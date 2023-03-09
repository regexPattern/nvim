require("settings")
require("keymaps")

-- install lazy nvim if not available
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- setup plugins
require("lazy").setup("plugins", {
	default = {
		lazy = false,
		version = "*",
	},
	change_detection = { notify = false },
})

require("nvim-magic")

vim.cmd [[ colo nord ]]
