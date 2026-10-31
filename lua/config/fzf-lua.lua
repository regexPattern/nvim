return {
  winopts = {
    border = "none",
    fullscreen = true,
    preview = {
      border = "single",
      horizontal = "right:50%"
    }
  },
  grep = { hidden = true },
  keymap = {
    fzf = {
      ["ctrl-q"] = "select-all+accept"
    }
  }
}
