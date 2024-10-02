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

local hunk_format = function()
  local hunks = require("gitsigns").get_hunks()
  local format = require("conform").format

  for i = #hunks, 1, -1 do
    local hunk = hunks[i]

    if hunk ~= nil and hunk.type ~= "delete" then
      local start = hunk.added.start
      local last = start + hunk.added.count

      local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
      local range = {
        start = { start, 0 },
        ["end"] = { last - 1, last_hunk_line:len() },
      }

      format({ range = range })
    end
  end
end

vim.api.nvim_create_user_command("HunkFormat", hunk_format, {
  desc = "Format hunks",
})

vim.keymap.set({ "n", "v" }, "<leader>ch", "<cmd>HunkFormat<cr>", { desc = "Format hunks" })
