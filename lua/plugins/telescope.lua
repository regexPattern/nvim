return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({})
        },
        ["undo"] = {
          side_by_side = true,
          layout_strategy = "vertical",
          layout_config = {
            preview_height = 0.8,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
  end,
  keys = {
    {
      "<Leader>ff",
      function()
        require("telescope.builtin").fd({ hidden = true })
      end,
    },
    {
      "<Leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
    },
    {
      "<Leader>fg",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find({
          hidden = true,
        })
      end,
    },
    {
      "<Leader>fG",
      function()
        require("telescope.builtin").live_grep({ hidden = true })
      end,
    },
    {
      "<Leader>fd",
      function()
        require("telescope.builtin").find_files({
          cwd = os.getenv("HOME") .. "/.dotfiles",
          hidden = true,
        })
      end,
    },
    {
      "<Leader>fn",
      function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config"),
          hidden = true,
        })
      end,
    },
  },
}
