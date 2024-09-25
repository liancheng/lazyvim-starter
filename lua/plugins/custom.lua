-- Customized configuration for LazyVim plugins

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      -- Uses plain ASCII separators.
      options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          -- See: https://luals.github.io/wiki/settings/
          settings = {
            Lua = {
              workspace = {
                globals = {
                  "vim",
                  "hs",
                  "spoon",
                },
                library = {
                  -- For hammerspoon Lua configuration support.
                  string.format("%s/.hammerspoon/Spoons/EmmyLua.spoon/annotations", os.getenv("HOME")),
                },
              },
            },
          },
        },

        jsonnet_ls = {
          -- See: https://github.com/grafana/jsonnet-language-server/blob/698917f/editor/vim/README.md
          settings = {
            formatting = {
              MaxBlankLines = 1,
              StringStyle = "double",
            },
          },
        },
      },
    },
  },

  {
    "google/vim-jsonnet",
    init = function()
      -- Leaves formatting to the jsonnet-language-server.
      -- See the `jsonnet_ls` field in `nvim-lspconfig`.
      vim.g.jsonnet_fmt_on_save = 0
    end,
    config = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = "*.jsonnet.TEMPLATE",
        command = "setlocal filetype=jsonnet",
      })
    end,
  },

  {
    "folke/which-key.nvim",
    keys = {
      {
        "<leader>uH",
        "<cmd>set invhlsearch<CR>",
        desc = "Toggle highlight search",
      },
    },
  },

  {
    "folke/noice.nvim",
    -- Noice causes cursor blinking excessively in Neovide.
    enabled = not vim.g["neovide"],
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>ci",
          node_incremental = "<tab>",
          scope_incremental = false,
          node_decremental = "<s-tab>",
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        bzl = { "buildifier" },
      },
    },
  },

  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<leader>fB", "<cmd>FzfLua builtin<cr>", desc = "Command History" },
      {
        "<leader>f/",
        function()
          require("fzf-lua").live_grep({
            cmd = "git grep --line-number --color=always",
          })
        end,
        desc = "Command History",
      },
    },
  },
}
