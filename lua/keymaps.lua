vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>pe', vim.cmd.Ex, { desc = '[P]roject [E]xplorer' })

local telescope = require 'telescope.builtin'

-- Telescope stuff
vim.keymap.set('n', '<leader>pf', telescope.find_files, { desc = '[P]roject [F]iles' })
vim.keymap.set('n', '<leader>pg', telescope.git_files, { desc = '[P]roject [G]it Files' })
vim.keymap.set('n', '<leader>ps', telescope.grep_string, { desc = '[P]roject [S]earch' })

-- Formatting
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})

-- Which-key
local whichkey = require 'which-key'

whichkey.add {
  { '<leader>p', group = 'Project' },
}
