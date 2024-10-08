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
    keys = {
      { "<leader>do", vim.cmd.DiffviewOpen, desc = "Open Diffview" },
      { "<leader>dc", vim.cmd.DiffviewClose, desc = "Close Diffview" },
    },
  },

  {
    "stevearc/oil.nvim",
    config = true,
    keys = {
      { "-", "<cmd>Oil --float<cr>", { desc = "Open Parent Directory (Oil)" } },
      { "_", "<cmd>Oil --float .<cr>", { desc = "Open CWD (Oil)" } },
    },
  },
}
