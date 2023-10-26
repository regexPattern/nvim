return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    {
      "s1n7ax/nvim-window-picker",
      config = true,
    },
  },
  config = {
    sources = {
      "filesystem",
      -- "buffers",
      -- "git_status",
    },
    default_source = "filesystem",
    enable_diagnostics = false,
    enable_git_status = true,
    enable_modified_markers = false,
    enable_opened_markers = false,
    use_popups_for_input = false,
    use_default_mappings = false,
    window = {
      position = "left",
      width = 35,
      mappings = {
        ["<CR>"] = "open_with_window_picker",
        ["R"] = "rename",
        ["D"] = "delete",
        ["%"] = {
          "add",
          config = { show_path = "relative" },
        },
        ["d"] = {
          "add_directory",
          config = { show_path = "relative" },
        },
        ["c"] = "copy_to_clipboard",
        ["m"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["<C-v>"] = "vsplit_with_window_picker",
        ["<C-x>"] = "split_with_window_picker",
      },
    },
    filesystem = {
      bind_to_cwd = false,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "disabled",
    },
    default_component_configs = {
      git_status = {
        -- Taken from the vscode official git plugin:
        -- https://github.com/microsoft/vscode/blob/570a2d8573a39b533bc1e960e295d52b04a1219c/extensions/git/src/repository.ts#L184
        symbols = {
          added = "A",
          deleted = "D",
          modified = "M",
          renamed = "R",
          untracked = "U",
          ignored = "I",
          unstaged = "",
          staged = "",
          conflict = "!",
        },
      },
    },
  },
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
  end,
  keys = {
    {
      "<Leader>E",
      ":Neotree toggle<CR>",
      silent = true,
    },
  },
}
