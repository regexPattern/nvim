return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mini.icons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  opts = {
    sources = {
      "filesystem",
      "document_symbols",
    },
    enable_diagnostics = false,
    use_default_mappings = false,
    use_popups_for_input = false,
    window = {
      width = 30,
      mappings = {
        ["<CR>"] = "open",
      },
    },
    default_component_configs = {
      container = {
        enable_character_fade = false,
        right_padding = 1,
      },
      icon = {
        provider = function(icon, node)
          local text, hl
          local mini_icons = require("mini.icons")

          if node.type == "file" then
            text, hl = mini_icons.get("file", node.name)
          elseif node.type == "directory" then
            _, hl = mini_icons.get("directory", node.name)
          end

          icon.text = text or icon.text
          icon.highlight = hl or icon.highlight
        end,
      },
      git_status = {
        symbols = {
          added = "A",
          modified = "M",
          deleted = "D",
          renamed = "R",
          untracked = "U",
          ignored = "I",
          unstaged = "?",
          staged = "+",
          conflict = "!",
        },
      },
    },
    filesystem = {
      hijack_netrw_behavior = "disabled",
      bind_to_cwd = false,
      filtered_items = {
        show_hidden_count = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        follow_current_file = {
          enabled = false,
        },
        group_empty_dirs = true,
      },
      window = {
        mappings = {
          ["<Leader>e"] = function(state)
            local node = state.tree:get_node()
            vim.cmd("e " .. node.path)
          end,
        },
      },
    },
  },
  keys = {
    { "<Leader>E", ":Neotree toggle<CR>", silent = true },
  },
}
