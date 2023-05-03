return {
  "rest-nvim/rest.nvim",
  ft = "http",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = {
    result_split_horizontal = true,
    result_split_in_place = false,
    jump_to_request = true,
  },
}
