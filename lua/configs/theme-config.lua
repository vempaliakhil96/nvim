require('catppuccin').setup {
  flavour = 'auto', -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = 'latte',
    dark = 'mocha',
  },
}
vim.cmd.colorscheme 'catppuccin'
