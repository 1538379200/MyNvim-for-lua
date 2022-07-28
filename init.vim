lua << EOF
require('plugins')
require('lsp')
require('init_lspconfig')
require('keymap')
require('test')
EOF

" ----------------------------nvim基础配置------------------------------------
set nobackup
set noswapfile
set noundofile
set backupdir=D:/VimTemp
set number
set relativenumber
set mouse=a
set shiftwidth=4
set cursorline
set cursorcolumn
set showcmd
set fileencoding=utf-8
set tabstop=4
set autoread
set termguicolors
" set background = light

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

" 平滑滚动
" lua require('neoscroll').setup()

" set QuickRun 
" nnoremap <F10> <Esc>:QuickRun<CR>

" sfile此文件路径，如果改成%，则是调用命令的文件
" 直接使用F10在命令行中显示运行内容
function! RunScript()
python << EOF
import vim
filepath = vim.eval('expand("%")')
if filepath.split(".")[-1] == "py":
	vim.command(f'pyf {filepath}')
EOF
endfunction

" 使用Ctrl + F10可以使用新的窗口存放
function! RunScriptInBuf()
python << EOF
import vim
import datetime


filepath = vim.eval('expand("%")')
if filepath.split(".")[-1] == "py":
	# vim.command("redir @+")
	# vim.command(f'pyf {filepath}')
	# vim.command("vsplit output")
	# vim.current.line = ("-"*10 + f" Running {datetime.datetime.now()} \" + \"-"*10)
	# vim.command('put +')
	# vim.command("redir END")
	vim.command(f"term py {filepath}")
EOF
endfunction
nnoremap <F10> <Esc>:call RunScript()<CR>
nnoremap <C-F10> <Esc>:call RunScriptInBuf()<CR>
nnoremap <C-Up> <C-y>
nnoremap <C-Down> <C-e>




