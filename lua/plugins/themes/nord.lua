return {
  "gbprod/nord.nvim",
  opts = {
    transparent = true,
    errors = { mode = "none" },
    styles = {
      comments = { italic = false },
    },
    on_highlights = function(hl, c)
      -- neotree
      hl.NeoTreeRootName = {
        fg = c.snow_storm.origin,
        bold = true,
      }
      hl.NeoTreeIndentMarker = { fg = c.polar_night.brighter }
      hl.NeoTreeGitAdded = { fg = c.aurora.green }
      hl.NeoTreeGitConflict = { fg = c.frost.artic_ocean }
      hl.NeoTreeGitDeleted = { fg = c.aurora.red }
      hl.NeoTreeGitIgnored = { fg = c.snow_storm.origin }
      hl.NeoTreeGitModified = { fg = c.aurora.yellow }
      hl.NeoTreeGitUnstaged = { fg = c.aurora.green }
      hl.NeoTreeGitUntracked = { fg = c.aurora.green }
      hl.NeoTreeGitStaged = { fg = c.aurora.yellow }

      -- cmp
      hl.CmpItemMenu = { fg = c.polar_night.light }
      hl.CmpItemMenuDefault = { fg = c.polar_night.light }
    end,
  },
  config = function(spec)
    require("nord").setup(spec.opts)
    vim.cmd.colorscheme "nord"
  end,
}
