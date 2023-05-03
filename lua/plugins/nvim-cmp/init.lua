return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- required snippet engine.
    {
      "L3MON4D3/LuaSnip",
      config = function()
        require("luasnip").config.set_config({
          history = true,
          region_check_events = "InsertEnter",
          delete_check_events = "TextChanged,InsertLeave",
        })
      end,
    },
    "saadparwaiz1/cmp_luasnip",

    -- sources
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "mtoohey31/cmp-fish",
  },
  config = function()
    local cmp = require("cmp")
    local compare = require("cmp.config.compare")
    local luasnip = require("luasnip")

    local custom_compare = require("plugins.nvim-cmp.sorting")

    require("cmp").setup({
      mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-p>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item({ select = true })
          else
            cmp.complete()
          end
        end),
        ["<C-n>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item({ select = true })
          else
            cmp.complete()
          end
        end),
        ["<C-j>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      sources = {
        { name = "nvim_lsp" },
        {
          name = "path",
          option = {
            -- paths for files used at runtime are resolved relative to the
            -- directory from where you run the binary, but most of the time
            -- i'm editing a rust file, i'm in a cargo project, that means that
            -- i run the binary relative to the binary crate's root. source
            -- files are nested under a 'src' directory, so completing file
            -- paths relative to each file isn't useful.
            --
            get_cwd = function(params)
              local filetype = vim.api.nvim_buf_get_option(0, "filetype")
              if filetype == "rust" then
                return vim.fn.getcwd()
              end

              return vim.fn.expand(("#%d:p:h"):format(params.context.bufnr))
            end,
          },
        },
        { name = "luasnip" },
        {
          name = "buffer",
          keyword_length = 3,
          option = {
            get_bufnrs = function()
              local bufs = {}
              for _, win in ipairs(vim.api.nvim_list_wins()) do
                bufs[vim.api.nvim_win_get_buf(win)] = true
              end
              return vim.tbl_keys(bufs)
            end,
          },
        },
      },
      sorting = {
        priority_weight = 2,
        comparators = {
          compare.offset,
          compare.score,
          compare.sort_text,
          compare.recently_used,
          compare.locality,
          custom_compare.label,
          custom_compare.kind,
        },
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
          luasnip.lsp_expand(args.body)
        end,
      },
      formatting = {
        fields = { "abbr", "menu", "kind" },
        format = function(entry, item)
          local short_name = {
            nvim_lsp = "LSP",
            nvim_lua = "nvim",
          }

          local menu_name = short_name[entry.source.name] or entry.source.name

          item.menu = string.format("[%s]", menu_name)
          return item
        end,
      },
    })
  end,
  init = function()
    vim.o.pumheight = 15
  end,
}
