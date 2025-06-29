vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>pe', vim.cmd.Ex, { desc = '[P]roject [E]xplorer' })

local telescope = require 'telescope.builtin'

-- Telescope stuff
vim.keymap.set('n', '<leader>pf', telescope.find_files, { desc = '[P]roject [F]iles' })
vim.keymap.set('n', '<leader>pg', telescope.git_files, { desc = '[P]roject [G]it Files' })
vim.keymap.set('n', '<leader>ps', telescope.grep_string, { desc = '[P]roject [S]earch' })

-- Formatting
vim.keymap.set('n', '<leader>ff', ':Format<CR>', { desc = '[F]ile [F]ormat' })

-- Which-key
local whichkey = require 'which-key'

whichkey.add {
  { '<leader>p', group = 'Project' },
  { '<leader>f', group = 'File' },
}

-- Convinience
vim.keymap.set('n', 'L', '$', { desc = 'End of line' })
vim.keymap.set('n', 'H', '^', { desc = 'Start of line' })

-- Toggle b/w open panes
vim.keymap.set('n', '<leader>t', '<C-w>w', { desc = 'Toggle b/w open panes' })
