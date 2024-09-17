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
      -- Use plain ASCII separators.
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
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader>sB", "<cmd>Telescope builtin<CR>", desc = "Builtin pickers" },
    },
  },

  {
    "google/vim-jsonnet",
    init = function()
      -- Leave formatting to the jsonnet-language-server.
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
          init_selection = "<tab>",
          node_incremental = "<tab>",
          scope_incremental = false,
          node_decremental = "<s-tab>",
        },
      },
    },
  },

  {
    dir = "~/local/src/bubble.nvim",
    opts = { name = "Cheng" },
  },
}
