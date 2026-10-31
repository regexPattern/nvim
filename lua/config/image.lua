local dimensions = require("image/utils/dimensions")
local magic = require("image/utils/magic")
local get_dimensions = dimensions.get_dimensions

dimensions.get_dimensions = function (path)
  if magic.detect_format(path) == "webp" then
    return nil
  end
  return get_dimensions(path)
end

return {
  backend = "kitty",
  processor = "magick_cli",
  integrations = {
    markdown = {
      enabled = true,
      filetypes = { "markdown" },
      download_remote_images = true,
      only_render_image_at_cursor = false,
      clear_in_insert_mode = true
    },
    asciidoc = { enabled = false },
    neorg = { enabled = false },
    rst = { enabled = false },
    typst = { enabled = false }
  }
}
