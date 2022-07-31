# MyNvim-for-lua
使用lua写的关于nvim的配置文件，并非完全弃用vimscript，而是结合lua、python、vimscript，编写满足使用需求的编辑器脚本
> 在vim文件中编辑lua代码，前面需要加上lua字样，指明lua块

``` lua require(xxx).setup{} ```
``` 
lua <<< EOF
. 
.
.
EOF
```
> 使用python编写vim代码(非插件，vim中编辑)，这些EOF都是标记字符，可以为任意字符
```python
python << EOF
import vim

xxxxx
EOF
```

## 所需环境工具

- node.js
- python
- git
- neovim

## 配置windows terminal
> 不要装在自带PowerShell中，会出现报错，不能消除

- 在windows商店中下载 windows terminal 和 oh-my-posh
- 搜索下载PowerShell7，[PowerShell 7 下载](https://github.com/PowerShell/PowerShell)
- 下载后，使用```notepad $profile``` 编辑配置文件，如果找不到路径，使用```$profile```查看路径，创建路径，再次打开
- 在$profile文件中输入```oh-my-posh init pwsh | Invoke-Expression```
- 在PowerShell中输入```Get-PoshThemes```，导入全部主题，导入完成会显示保存的位置
- 如果放在Program Files (x86)可能会在写入的时候不能识别，如果在这里可以选择将下载的主题放在其他地方
- 重新打开```notepad $profile```，输入```oh-my-posh init pwsh --config D:\TerminalThemes\M365Princess.omp.json | Invoke-Expression```，保存
- 重启PowerShell即可显示
- 在运行命令中，使用```pwsh```打开PowerShell 7程序

## 配置terminal字体
- 在[Nerd Donts](https://www.nerdfonts.com/font-downloads)中下载喜欢的字体，这里使用的```meslo nerd font```
- 下载完成后解压，随便点击一个文件进行安装
- 重启windows terminal，在默认值--外观那里设置文字
![image](https://user-images.githubusercontent.com/42434762/180972268-b6e92b27-9f82-47dd-9d01-b1e277d8d1ae.png)
- 文字安装和oh-my-posh安装先后都可

## windows terminal常用快捷键
> 完整windows terminal的快捷键和修改，可以去设置中操作查看

- ```alt``` + ```shift``` + ```=+```: 左右分屏
- ```alt``` + ```shift``` + ```-_```: 上下分屏
- ```alt``` + ```shift``` + ```D```: 默认分屏(左右分屏)
- ```alt``` + 方向键: 进行分屏间移动
- ```alt``` + ```shift``` + 方向键: 进行分屏大小调整
- ```ctrl``` + ```shift``` + ```W```: 关闭当前分屏，一般直接在terminal内输入```exit```回车关闭
- ```alt``` + 鼠标滚轮/```+/-```: 放大缩小屏幕字体
- ```ctrl``` + ```shift``` + 上下方向键: 移动屏幕内容
- ```ctrl``` + ```shift``` + ```pgup/pgdn```: 上下翻页屏幕内容
- ```ctrl``` + ```shift``` + ```home/end```: 到顶部和底部
- ```ctrl``` + ```shift``` + ```C```: 复制，复制粘贴也可以直接用ctrl，但是ctrl+c可能有时候会造成程序关闭或代码程序终止
- ```ctrl``` + ```shift``` + ```V```: 粘贴
- ```ctrl``` + ```s```: 暂停屏幕内容输出
- ```ctrl``` + ```q```: 继续屏幕输出
光标操作
- ```ctrl``` + 左右方向键: 调到单词开头
- ```shift``` + 左右方向键: 区域选中
- ```ctrl``` + ```a```: 全选
- ```ctrl``` + ```w```: 删除前一个单词
- ```home/end```: 开头结尾，可以结合shift进行全选等
![image](https://user-images.githubusercontent.com/42434762/181673680-c3b388f2-fe4b-4e25-acc8-0c25cb1ad74b.png)

## windows terminal分屏没有样式处理
打开配置json文件，在actions中，添加如下代码，替换原来的分屏设置：
```json
{
  "command":{
      "action": "splitPane",
      "split": "horizontal",
      "splitMode": "duplicate"
  },
  "keys": "alt+shift+_"
},
{
  "command":{
      "action": "splitPane",
      "split": "vertical",
      "splitMode": "duplicate"
  },
  "keys": "alt+shift+plus"
}
```
> ```duplicate```是分屏获取当前终端的配置加载


## nvim安装配置

- 在```C:\Users\<name>\AppData\Local```下创建一个nvim文件夹
- 使用git clone，将项目放到nvim文件夹，如果进入nvim文件夹看到的不是```init.vim```等和项目一样的所有文件，则进入MyNvim-for-lua文件夹，将里面的文件、文件夹全部剪切到nvim文件夹下
- ```pip install neovim```安装python扩展
- 使用```npm i -g [language server]``` 为lsp安装语言服务器，也可以在nvim中使用```:LspInstall [language server]```安装，不知道名字可以去[nvim-lsp-install](https://github.com/williamboman/nvim-lsp-installer#available-lsps)
查看
- 进入nvim程序，```:PackerInstall```或者```:PackerSync```安装更新全部插件


## 预览

![image](https://user-images.githubusercontent.com/42434762/181021793-686e883a-0c50-4ead-998e-da8738a2ae2e.png)
![image](https://user-images.githubusercontent.com/42434762/180933865-8f63d266-5dcd-43d4-b605-16764dcc1acd.png)
![image](https://user-images.githubusercontent.com/42434762/180933925-805f9ec9-c5d7-40bb-adf0-09be44aabd4b.png)
![image](https://user-images.githubusercontent.com/42434762/181533919-f82cdad7-6e6a-4000-b269-419a38329a01.png)


## 修改配色

> 可以在[vim.org](https://www.vim.org/scripts/script.php?script_id=625)网页底部下载配色，color文件夹放init.vim同级，plugin文件夹内容移动到init.vim同级的plugin文件夹中，此配置已下载全部配色

可以通过修改 init.vim中的colorscheme来更改配色

在nvim程序界面，```:colorscheme```加空格，然后TAB可以在当前选择、查看不同的配色主题(此处为gruvbox)

修改```init.vim```中的```background```可以改变light或者drak等模式
![image](https://user-images.githubusercontent.com/42434762/180963299-4c2c5e42-e6c9-4668-970b-4ad3f977ac47.png)

## 键位操作
> 键位映射操作可以在```lua/keymap.lua```/```init.vim```中进行修改

- ```ctrl + n``` 可以打开/关闭文件树，文件树可以按m标记批量操作
- ```crtl + w + w```/```ctrl + w + [方向键]``` 切换窗口
- ```space + [左右方向键]``` 切换标签
- ```space + ↓``` 选择关闭标签
- ```ctrl + ↑``` 与ctrl + y相同，向上滚动屏幕
- ```ctrl + ↓``` 与ctrl + e相同，向下滚动屏幕
- ```F10``` 运行python或者golang代码，在内置terminal中打开，使用i加任意键可退出
- ```ctrl + F10``` 运行python或者golang代码，使用悬浮窗口显示代码运行结果，:q即可退出窗口，和普通窗口一样
- ```gcc```快速注释一行代码，选中区域```gc```可以注释选中区域
- ```space space```，进入符号操作模式，输入任意符号回车，即可将光标所在单词用此符号包裹，space为默认leader按键
- vim-surround操作快捷键可查看其文档


- 其他操作为vim基础操作，未做改变

## 正在使用部分插件
> 这里只是显示部分使用插件，并不一定是全部的插件，其插件也有其他依赖项

- 标签、状态栏样式插件: [vim-airline](https://github.com/vim-airline/vim-airline)
- 便捷安装lsp服务: [lsp-install](https://github.com/williamboman/nvim-lsp-installer)
- 文件树目录: [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
- 代码纠错提示插件: [lsp](https://github.com/neovim/nvim-lspconfig)
- 代码补全插件: [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- 包管理插件: [packer](https://github.com/wbthomason/packer.nvim)
- vim可选包管理: [vim-plug](https://github.com/junegunn/vim-plug)
- gcc批量注释
- rainbow彩虹括号: [rainbow](https://github.com/luochen1990/rainbow)
- css颜色匹配: [vim-css-color](https://github.com/ap/vim-css-color)
- 符号补全: [autopaiirs](https://github.com/windwp/nvim-autopairs)
- 快捷符号替换、添加: [vim-surround](https://github.com/tpope/vim-surround)

## 常见疑问
- 为什么python代码不适用pynvim编写插件形式
  - 使用pynvim去编写python插件可能还需要进行上传等操作，编写也比较麻烦，对于比较小的代码块，就直接放在vimscript中进行调用了
- 为什么下载插件比较慢，有些失败了
  - 大部分插件都是存在于github之中，所以在国内进行访问，可能比较麻烦


