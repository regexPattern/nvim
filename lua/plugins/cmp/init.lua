return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- sources
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"mtoohey31/cmp-fish",

		-- config
		"onsails/lspkind.nvim",
		"saadparwaiz1/cmp_luasnip",
		{
			"L3MON4D3/LuaSnip",
			config = function()
				require("luasnip").config.set_config({
					region_check_events = "InsertEnter",
					delete_check_events = "InsertLeave",
				})
			end,
		},
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			preselect = cmp.PreselectMode.None,
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion    = { border = "none" },
				documentation = { border = "single" },
			},
			sources = {
				{ name = "nvim_lsp" },
				{
					name = "path",
					option = {
						get_cwd = function(params)
							local filetype = vim.api.nvim_buf_get_option(0, "filetype")

							if filetype == "rust" or filetype == "fish" then
								return vim.fn.getcwd()
							end

							return vim.fn.expand(('#%d:p:h'):format(params.context.bufnr))
						end,
					},
				},
				{ name = "luasnip"  },
				{
					name = "buffer",
					keyword_length = 3,
				},
				{ name = "fish"     },
			},
			mapping = {
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-j>"] = cmp.mapping(function(fallback)
					if luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
					end, { "i" }),
				["<C-k>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
					end, { "i" }),
			},
			sorting = require("plugins.cmp.sorting"),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = require("lspkind").cmp_format({
					mode = "symbol",
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
			experimental = {
				ghost_text = true,
			},
		})
	end,
	init = function()
		vim.o.pumheight = 10
		vim.o.completeopt = "menu,menuone,noselect"
	end,
}
