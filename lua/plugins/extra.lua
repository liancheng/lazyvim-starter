-- Configurations for non-LazyVim plugins.
return {
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

  {
    "stevearc/oil.nvim",
    opts = {},
  },

  {
    "vhyrro/luarocks.nvim",
    priority = 1024,
    opts = {
      rocks = { "fun", "stdlib", "std.functional" },
    },
  },
}
