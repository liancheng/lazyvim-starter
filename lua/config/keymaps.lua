-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disables the "Prev Buffer" and "Next Buffer" keymaps.
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")

vim.keymap.set("n", "<leader>uH", "<cmd>set invhlsearch<cr>", {
  desc = "Toggle Highlight Search",
  remap = true,
})

-- Unifies cycling through buffers and tabs
vim.keymap.set("n", "gt", "]b", { desc = "Next Buffer", remap = true })
vim.keymap.set("n", "gT", "[b", { desc = "Prev Buffer", remap = true })

-- Makes Neovide work with the system clipboard
if vim.g["neovide"] then
  vim.keymap.set("v", "<D-c>", [["+y]], { desc = "Copy" })
  vim.keymap.set({ "n", "v" }, "<D-v>", [["+p]], { desc = "Paste" })
  vim.keymap.set("c", "<D-v>", [[<C-r>+]], { desc = "Paste" })
  vim.keymap.set("i", "<D-v>", [[<esc>"+pa]], { desc = "Paste" })
end

local format_hunks = function()
  require("fun")
    .iter(require("std").ireverse(require("gitsigns").get_hunks()))
    :filter(function(_) return _ ~= nil and _.type ~= "delete" end)
    :map(function(hunk)
      local start = hunk.added.start
      local last = start + hunk.added.count - 1
      local last_line = vim.api.nvim_buf_get_lines(0, last - 1, last, true)[1]
      return {
        range = {
          start = { start, 0 },
          ["end"] = { last, last_line:len() },
        },
      }
    end)
    :each(require("conform").format)
end

vim.keymap.set({ "n", "v" }, "<leader>ch", format_hunks, {
  desc = "Format Hunks",
})
