return --[[ {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "luasnip",
    "saadparwaiz1/cmp_luasnip",

    -- sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "mtoohey31/cmp-fish",
  },
  init = function()
    vim.opt.pumheight = 15
    vim.opt.completeopt = "menu,menuone,noselect"
  end,
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        {
          name = "path",
          option = {
            get_cwd = function(params)
              local ft = vim.api.nvim_get_option_value("filetype", { scope = "local" })
              if vim.tbl_contains({ "fish", "rust" }, ft) then
                return vim.fn.getcwd()
              end

              return vim.fn.expand(("#%d:p:h"):format(params.context.bufnr))
            end,
          }
        },
        { name = "fish" },
      },
      mapping = {
        ["<Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end,
        ["<C-n>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
        ["<C-p>"] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
      },
      snippet = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    })
  end,
} ]]
