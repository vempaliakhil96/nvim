-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Show Copilot as inline ghost-text suggestions instead of through the completion menu
vim.g.ai_cmp = false

-- Allow project-local config via .nvim.lua in project root
vim.o.exrc = true

-- Use block cursor in all modes
vim.opt.guicursor = "a:block-Cursor/lCursor"
vim.api.nvim_set_hl(0, "Cursor", { bg = "#ffffff", fg = "#000000" })
vim.api.nvim_set_hl(0, "lCursor", { bg = "#ffffff", fg = "#000000" })
