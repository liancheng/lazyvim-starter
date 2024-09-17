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

  {
    "OXY2DEV/markview.nvim",
    lazy = false,

    opts = {
      headings = {
        shift_width = 0,
      },

      list_items = {
        shift_width = 2,
      },
    },

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
