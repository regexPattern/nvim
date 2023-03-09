return {
	"nvim-neo-tree/neo-tree.nvim",
  enabled = false,
	branch = "v2.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		{
			"s1n7ax/nvim-window-picker",
			config = {
				fg_color = "#434C5E",
				current_win_hl_color = "#D8DEE9",
				other_win_hl_color = "#D8DEE9",
			},
		},
	},
	config = {
		use_popups_for_input = false,
		use_default_mappings = false,
		window = {
			width = 32,
			mappings = {
				["<"] = "prev_source",
				[">"] = "next_source",
			},
		},
		default_component_configs = {
			git_status = {
				symbols = {
					-- change type
					added     = "A",
					deleted   = "D",
					modified  = "M",
					renamed   = "R",
					-- status type
					untracked = "U",
					ignored   = "I",
					unstaged  = "U",
					staged    = "S",
					conflict  = "C",
				},
			},
		},
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = false,
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
				hijack_netrw_behavior = "disabled",
			},
			window = {
				mappings = {
					-- navigation
					["-"] = "navigate_up",
					["<CR>"] = function(state)
            local fs = require("neo-tree.sources.filesystem.commands")
            local tree = state.tree
            local node = tree:get_node()
            if node.type == "directory" then
              fs.set_root(state)
            else
              fs.open(state)
            end
					end,
					-- TODO: I would like to add something like an indicator to notice
					-- clearly when I'm viewing a preview.
					["P"]     = "toggle_preview",
					["l"]     = "focus_preview",
					["<ESC>"] = "revert_preview",
					["<C-x>"] = "open_split",
					["<C-v>"] = "open_vsplit",
					["<C-t>"] = "open_tabnew",
					--file actions
					["a"] = "add",
					["d"] = "add_directory",
					["D"] = "delete",
					["R"] = "rename",
				},
			},
		},
	},
	keys = {
		{ "<Leader>e", ":Neotree toggle current reveal_force_cwd<CR>" },
	},
}
