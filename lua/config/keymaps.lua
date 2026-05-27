-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- CodeCompanion Chat
vim.keymap.set("n", "go", ":CodeCompanionChat Toggle<CR>", { noremap = true, silent = true })

-- Save current buffer with leader+w
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })

-- Yank without moving cursor in visual mode
vim.keymap.set("v", "y", "ygv<Esc>", { noremap = true, silent = true })

-- Delete previous word with Option+Backspace in insert/command mode
vim.keymap.set({ "i", "c" }, "<M-BS>", "<C-w>", { noremap = true, silent = true })
vim.keymap.set({ "i", "c" }, "<M-Del>", "<C-w>", { noremap = true, silent = true })
vim.keymap.set({ "i", "c" }, "<Esc><BS>", "<C-w>", { noremap = true, silent = true })
vim.keymap.set({ "i", "c" }, "<Esc><Del>", "<C-w>", { noremap = true, silent = true })
