-- Vanilla Config
require('user.settings')
--require('user.autocmd')
require('user.plugins')
require('user.keymaps')
require('onedark').setup {
  style = 'deep'
}
require('onedark').load()
require('user.lsp')
