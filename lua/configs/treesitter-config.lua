local configs = require 'nvim-treesitter.configs'
configs.setup {
  ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'elixir', 'heex', 'javascript', 'html', 'kotlin', 'java' },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
}
