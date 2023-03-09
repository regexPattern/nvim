return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "comment",
          "help",
          "lua",
          "rust",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          disable = function(lang, buf)
            -- disable treesitter highlight for big files.
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
        indent = {
          enable = true,
        },
        playground = {
          enable = true,
        },
      })

      -- install custom parsers or override specific ones for certain filetypes.
      local parsers = require("nvim-treesitter.parsers").get_parser_configs()

      parsers.sql = {
        install_info = {
          url = "https://github.com/DerekStride/tree-sitter-sql",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "sql",
      }

      parsers.gitignore = {
        install_info = {
          url = "https://github.com/shunsambongi/tree-sitter-gitignore",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "gitignore",
      }
    end,
  },
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
  },
}
