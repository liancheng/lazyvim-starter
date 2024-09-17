-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local venv_path = vim.fn.stdpath("config") .. "/.venv"
local uv = vim.uv or vim.loop

if not uv.fs_stat(venv_path) then
  vim.g.python3_host_prog = venv_path .. "/bin/python"
  vim.fn.system({ "uv", "venv" })
  vim.fn.system({ "uv", "pip", "install", "pynvim" })
end

vim.g.python3_host_prog = venv_path .. "/bin/python"
vim.opt.scrolloff = 0

if vim.g["neovide"] then
  vim.g.neovide_cursor_animation_length = 0.05
  vim.opt.guifont = "CaskaydiaMono Nerd Font:h16"
end

-- Disables the annoying OMNI SQL completion keymaps.
-- See :help sql-completion
vim.g.omni_sql_no_default_maps = 1
