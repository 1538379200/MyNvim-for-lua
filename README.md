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


## 安装配置

确保有node.js、python

- ```pip install neovim```安装python扩展
- 使用```npm i -g [language server]``` 为lsp安装语言服务器，也可以使用LspInstall安装
- 进入nvim，```:PackerInstall```或者```:packerSync```安装更新全部插件


##预览

![image](https://user-images.githubusercontent.com/42434762/180933865-8f63d266-5dcd-43d4-b605-16764dcc1acd.png)
![image](https://user-images.githubusercontent.com/42434762/180933925-805f9ec9-c5d7-40bb-adf0-09be44aabd4b.png)

可以通过修改 init.vim中的colorscheme来更改配色
在nvim界面，```:colorscheme```加空格，然后TAB可以在当前选择、查看不同的配色主题
![image](https://user-images.githubusercontent.com/42434762/180963299-4c2c5e42-e6c9-4668-970b-4ad3f977ac47.png)

