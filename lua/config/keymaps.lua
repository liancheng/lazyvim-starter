-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disables the "Prev Buffer" and "Next Buffer" keymaps.
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")

-- Makes Neovide work with the system clipboard
if vim.g["neovide"] then
  vim.keymap.set("v", "<D-c>", [["+y]], { desc = "Copy" })
  vim.keymap.set({ "n", "v" }, "<D-v>", [["+p]], { desc = "Paste" })
  vim.keymap.set("c", "<D-v>", [[<C-r>+]], { desc = "Paste" })
  vim.keymap.set("i", "<D-v>", [[<esc>"+pa]], { desc = "Paste" })
end
