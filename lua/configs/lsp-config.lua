require('mason').setup {
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
}

require('lspconfig').lua_ls.setup {
  settings = {
    Lua = { diagnostics = { globals = { 'vim' } } },
  },
}
