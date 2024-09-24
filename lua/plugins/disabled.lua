return {
  -- Uses hlchunk instead.
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },

  {
    "nvimdev/dashboard-nvim",
    enabled = false,
  },

  {
    "OXY2DEV/markview.nvim",
    enabled = false,
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
