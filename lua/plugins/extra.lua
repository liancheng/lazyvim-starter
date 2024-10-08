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
    opts = {},
  },

  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown" },
        },
      },
      max_width = nil,
      max_height = nil,
      max_width_window_percentage = nil,
      max_height_window_percentage = 50,
      kitty_method = "normal",
    },
  },
}
