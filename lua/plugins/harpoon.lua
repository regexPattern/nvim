return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon"):setup()
  end,
  keys = {
    {
      "<Leader>ha",
      function()
        require("harpoon"):list():append()
      end,
    },
    {
      "<Leader>hh",
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
    },
    unpack((function()
      local keys = {}
      for i = 1, 4 do
        table.insert(keys, {
          "<Leader>h" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
        })
      end
      return keys
    end)()),
  },
}
