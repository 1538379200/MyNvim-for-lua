lua << EOF
require('baseConf')
require('plugins')
require('lsp')
require('init_lspconfig')
require('keymap')
require('bufferline')
EOF
let g:airline_theme='solarized'
colorscheme gruvbox
