return {
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				}
			}
		}
	},
	rust_analyzer = {
		cmd = { "rustup", "run", "stable", "rust-analyzer" },
	},
	jsonls = {
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	},
}
