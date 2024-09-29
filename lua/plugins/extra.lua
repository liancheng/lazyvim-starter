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
    "almo7aya/openingh.nvim",
    keys = {
      {
        "<leader>G",
        "<cmd>OpenInGHFile<cr>",
        mode = "n",
        desc = "Open file in GitHub",
      },
      {
        "<leader>G",
        "<cmd>OpenInGHFileLines<cr>",
        mode = "v",
        desc = "Open lines in GitHub",
      },
    },
  },

  {
    "sindrets/diffview.nvim",
    opts = {},
  },
}
