return {}

--[[ return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    {
      "mtoohey31/cmp-fish",
      ft = "fish",
    },
  },
  init = function()
    vim.opt.pumheight = 15
  end,
  config = function()
    local cmp = require "cmp"

    local opts = {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }

    local sources = {
      { name = "nvim_lsp" },
      {
        name = "path",
        option = {
          -- Resolve relative paths as relative Neovim's cwd.
          get_cwd = function(params)
            local ft = vim.api.nvim_get_option_value("filetype", { scope = "local" })
            if vim.tbl_contains({ "fish", "rust" }, ft) then
              return vim.fn.getcwd()
            end
            return vim.fn.expand(("#%d:p:h"):format(params.context.bufnr))
          end,
        },
      },
      {
        name = "buffer",
        keyword_length = 3,
        option = {
          -- Only include visible buffers (buffers that are loaded into a window).
          get_bufnrs = function()
            local buffers = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              buffers[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(buffers)
          end,
        },
      },
    }

    cmp.setup {
      mapping = {
        ["<Tab>"] = function(fb)
          if cmp.visible() then
            cmp.confirm(opts)
          else
            fb()
          end
        end,
        ["<C-j>"] = cmp.mapping(function(fb)
          if vim.snippet.jumpable(1) then
            vim.snippet.jump(1)
          else
            fb()
          end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function(fb)
          if vim.snippet.jumpable(-1) then
            vim.snippet.jump(-1)
          else
            fb()
          end
        end, { "i", "s" }),
        ["<C-p>"] = function()
          if cmp.visible() then
            cmp.select_prev_item(opts)
          else
            cmp.complete()
          end
        end,
        ["<C-n>"] = function()
          if cmp.visible() then
            cmp.select_next_item(opts)
          else
            cmp.complete()
          end
        end,
      },
      sources = sources,
      window = {
        completion = { border = "none" },
        documentation = {
          border = "solid",
          max_height = 15,
          max_width = 60,
        },
      },
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
      formatting = {
        -- :h complete-items
        fields = { "kind", "abbr", "menu" },
      },
    }

    cmp.setup.filetype("fish", {
      sources = vim.tbl_extend("force", sources, { { name = "fish" } }),
    })
  end,
} ]]
