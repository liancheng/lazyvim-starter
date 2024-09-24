-- Configurations for non-LazyVim plugins.
return {
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      chunk = {
        enable = true,
        duration = 0,
        delay = 0,
        chars = {
          right_arrow = "─",
        },
        style = {
          { fg = require("catppuccin.palettes").get_palette("mocha").text },
        },
      },
      indent = {
        enable = true,
        chars = { "┊" },
      },
    },
  },
}
