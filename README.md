# MyNvim-for-lua
使用lua写的关于nvim的配置文件
> 在vim文件中编辑lua代码，前面需要加上lua字样，指明lua块

``` lua require(xxx).setup{} ```
``` 
lua <<< EOF
. 
.
.
EOF
```

## 配置windows terminal
> 不要装在自带PowerShell中，会出现报错，不能消除

- 在windows商店中下载 windows terminal 和 oh-my-posh
- 搜索下载PowerShell7，[PowerShell 7 下载](https://github.com/PowerShell/PowerShell)
- 下载后，使用notepad $profile 编辑配置文件，如果找不到路径，使用```$profile```查看路径，创建路径，再次打开
- 在$profile文件中输入```oh-my-posh init pwsh | Invoke-Expression```
- 在PowerShell中输入```Get-PoshThemes```，导入全部主题，导入完成会显示保存的位置
- 如果放在Program Files (x86)可能会在写入的时候不能识别，如果在这里可以选择将下载的主题放在其他地方
- 重新打开```notepad $profile```，输入```oh-my-posh init pwsh --config D:\TerminalThemes\M365Princess.omp.json | Invoke-Expression```，保存
- 重启PowerShell即可显示
- 在运行命令中，使用pwsh打开PowerShell 7程序

## 配置terminal字体
- 在[Nerd Donts](https://www.nerdfonts.com/font-downloads)中下载喜欢的字体，这里使用的```meslo nerd font```
- 下载完成后解压，随便点击一个文件进行安装
- 重启windows terminal，在默认值--外观那里设置文字
![image](https://user-images.githubusercontent.com/42434762/180972268-b6e92b27-9f82-47dd-9d01-b1e277d8d1ae.png)
- 文字安装和oh-my-posh安装先后都可

## 安装配置

确保有node.js、python

- ```pip install neovim```安装python扩展
- 使用```npm i -g [language server]``` 为lsp安装语言服务器，也可以在nvim中使用```:LspInstall [language server]```安装
- 进入nvim，```:PackerInstall```或者```:packerSync```安装更新全部插件


## 预览

![image](https://user-images.githubusercontent.com/42434762/180933865-8f63d266-5dcd-43d4-b605-16764dcc1acd.png)
![image](https://user-images.githubusercontent.com/42434762/180933925-805f9ec9-c5d7-40bb-adf0-09be44aabd4b.png)

## 修改配色

> 可以在[vim.org](https://www.vim.org/scripts/script.php?script_id=625)网页底部下载配色，color文件夹放init.vim同级，plugin文件夹内容移动到init.vim同级的plugin文件夹中

可以通过修改 init.vim中的colorscheme来更改配色

在nvim界面，```:colorscheme```加空格，然后TAB可以在当前选择、查看不同的配色主题(此处为gruvbox)

修改```lua/baseConfig.lua```中的```background```可以改变light或者drak等模式
![image](https://user-images.githubusercontent.com/42434762/180963299-4c2c5e42-e6c9-4668-970b-4ad3f977ac47.png)

## 键位操作
> 键位映射操作可以在```lua/keymap.lua```中进行修改

- ```ctrl + n``` 可以打开/关闭文件树
- ```crtl + w + w```/```ctrl + w + [方向键]``` 切换窗口
- ```Alt + [左右方向键]``` 切换标签
- ```Alt + ↓``` 选择关闭标签

## 正在使用插件

- 标签、状态栏样式插件: [vim-airline](https://github.com/vim-airline/vim-airline)
- 便捷安装lsp服务: [lsp-install](https://github.com/williamboman/nvim-lsp-installer)
- 文件树目录: [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
- 代码纠错提示插件: [lsp](https://github.com/neovim/nvim-lspconfig)
- 包管理插件: [packer](https://github.com/wbthomason/packer.nvim)
- vim可选包管理: [vim-plug](https://github.com/junegunn/vim-plug)


