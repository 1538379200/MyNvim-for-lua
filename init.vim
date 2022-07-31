lua << EOF
require('plugins')
require('lsp')
require('init_lspconfig')
require('keymap')
EOF

" 设置leader按键
let mapleader = " "

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
nnoremap <leader><Right> :bn<CR>		
nnoremap <leader><Left> :bp<CR>
nnoremap <leader><Down> :bd<CR>
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

" 彩虹括号配置
let g:rainbow_active = 1

" 符号匹配配置
lua << EOF
local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})
EOF

" 符号替换快捷键配置
noremap <leader><leader> <Esc>:norm ysiw


" ======================================= 以下为自己写的辅助代码脚本，可选择是否使用 ===================================

" ------------------文件代码运行(python编写)------------------
" sfile此文件路径，如果改成%，则是调用命令的文件，使用python定义快捷运行
" 使用F10利用内置terminal运行，i进行编辑后任意键即可退出
function! RunScript()
python << EOF
import vim
import datetime
filepath = vim.eval('expand("%")')
filetype = filepath.split(".")[-1]
if filetype == "py":
	# vim.command("redir @+")
	# vim.command(f'pyf {filepath}')
	# vim.command("vsplit output")
	# vim.current.line = ("-"*10 + f" Running {datetime.datetime.now()} \" + \"-"*10)
	# vim.command('put +')
	# vim.command("redir END")
	vim.command(f"term py {filepath}")
elif filetype == "go":
	vim.command(f"term go run {filepath}")
else:
	print("File types are not supported, you can add your own execution operations in init.vim\n不支持文件类型，你可以在init.vim中进行定义")
EOF
endfunction

" 悬浮窗口显示代码运行结果
function! RunnerFloat()
python << EOF
import vim
import datetime

# 获取当前的文件路径，如果使用sfile或者afile则获取的是此代码路径
filepath = vim.eval('expand("%")')
filetype = filepath.split('.')[-1]
# 获取当前窗口的宽高
width = vim.current.window.width
height = vim.current.window.height
# 设置悬浮窗口对于当前窗口的比例
window_w = int(width * 0.8)
window_h = int(height * 0.9)
# 新建一个buffer用于存储输出数据
# 两个参数，第一个是否设置到buflist中，第二个是否是一次性的
buf = vim.api.create_buf(False, True)
if filetype == 'py':
	# 运行命令并返回输出结果，这种方式不会在命令行中输出数据
	msg = vim.command_output(f'!py {filepath}')
elif filetype == 'go':
	msg = vim.command_output(f'!go run {filepath}')
else:
	print("File types are not supported, you can add your own execution operations in init.vim\n不支持文件类型，你可以在init.vim中进行定义")
msg_title = '='*10 + ' EndRunningTime: ' + str(datetime.datetime.now()) + '='*10
msg_list = [x for x in msg.split('\n')]
msg_list.insert(0, msg_title)
# 将输出的数据写入到新建的buffer中
vim.api.buf_set_lines(buf, 0, 1, True, msg_list)
# 设置根据当前窗口默认显示
opts = {'relative':'win', 'width':window_w, 'height': window_h, 'col': (width * 0.2)/2, 'row': 1, 'anchor':'NW', 'focusable':1}
# 打开一个窗口，option用上relative，则认为是一个悬浮的窗口
win = vim.api.open_win(buf, 1, opts)
# 设置窗口数据，进行高亮显示，此处是选择原有的高亮组，进修改了文字颜色
vim.api.win_set_option(win, 'winhl', 'Normal:TabLineSel')
EOF
endfunction

nnoremap <C-F10> <Esc>:call RunnerFloat()<CR>
nnoremap <F10> <Esc>:call RunScript()<CR>
nnoremap <C-Up> <C-y>
nnoremap <C-Down> <C-e>

