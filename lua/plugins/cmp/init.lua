return {
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
  config = function()
    local cmp = require "cmp"
    -- local defaultcomparators = require "cmp.config.compare"
    -- local customcomparators = require "plugins.cmp.compare"

    local select_opts = {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }

    cmp.setup {
      mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm(select_opts)
          elseif vim.snippet.jumpable(1) then
            vim.snippet.jump(1)
          else
            fallback()
          end
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if vim.snippet.jumpable(-1) then
            vim.snippet.jump(-1)
          else
            fallback()
          end
        end),
        ["<C-p>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item(select_opts)
          else
            cmp.complete()
          end
        end),
        ["<C-n>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item(select_opts)
          else
            cmp.complete()
          end
        end),
      },
      sources = {
        { name = "nvim_lsp" },
        {
          name = "path",
          option = {
            -- Resolve relative paths as relative Neovim's cwd.
            get_cwd = function(params)
              local filetype = vim.api.nvim_get_option_value("filetype", { scope = "local" })
              if vim.tbl_contains({ "fish", "rust" }, filetype) then
                return vim.fn.getcwd()
              end
              return vim.fn.expand(("#%d:p:h"):format(params.context.bufnr))
            end,
          },
        },
        { name = "fish" },
        {
          name = "buffer",
          keyword_length = 3,
          option = {
            -- Only include visible buffers (buffers that are loaded into a
            -- window).
            get_bufnrs = function()
              local buffers = {}
              for _, win in ipairs(vim.api.nvim_list_wins()) do
                buffers[vim.api.nvim_win_get_buf(win)] = true
              end
              return vim.tbl_keys(buffers)
            end,
          },
        },
      },
      sorting = {
        --[[ comparators = {
          defaultcomparators.offset,
          defaultcomparators.exact,
          defaultcomparators.score,
          defaultcomparators.sort_text,
          customcomparators.kind,
        }, ]]
      },
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
  end,
}
