vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>pe', vim.cmd.Ex, { desc = '[P]roject [E]xplorer' })

-- Convinience
vim.keymap.set('n', 'L', '$', { desc = 'End of line' })
vim.keymap.set('n', 'H', '^', { desc = 'Start of line' })

-- Toggle b/w open panes
vim.keymap.set('n', '<leader>t', '<C-w>w', { desc = 'Toggle b/w open panes' })

if not vim.g.vscode then
  require 'plugins'
  require 'configs'
  require 'keymaps'
end
