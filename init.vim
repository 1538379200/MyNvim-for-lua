lua << EOF
require('baseConf')
require('plugins')
require('lsp')
require('init_lspconfig')
require('keymap')
require('bufferline')
EOF

" 设置颜色主题
colorscheme gruvbox

" -----------------airline配置-----------------
"  设置切换、关闭tab标签快捷键，就是替换原来的bn和bp命令
nnoremap <A-Right> :bn<CR>		
nnoremap <A-Left> :bp<CR>
nnoremap <A-Down> :bd<CR>
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1        "显示buffer编号
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#battery#enabled = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_theme='solarized'
