vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>pe', vim.cmd.Ex, { desc = '[P]roject [E]xplorer' })

-- Convinience
vim.keymap.set({'n', 'v'}, 'L', '$', { desc = 'End of line' })
vim.keymap.set({'n', 'v'}, 'H', '^', { desc = 'Start of line' })

-- Copy/Paste
vim.keymap.set('n', '<leader>y', '"+y', { desc = '[Y]ank to system clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = '[Y]ank to system clipboard' })
vim.keymap.set('n', '<leader>p', '"+p', { desc = '[P]aste from system clipboard' })
vim.keymap.set('v', '<leader>p', '"+p', { desc = '[P]aste from system clipboard' })

-- Toggle b/w open panes
vim.keymap.set('n', '<leader>t', '<C-w>w', { desc = 'Toggle b/w open panes' })

if not vim.g.vscode then
  require 'plugins'
  require 'configs'
  require 'keymaps'
end
