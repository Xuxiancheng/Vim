" 基础设置
syntax enable
set nocompatible
set number
"相对行号
set relativenumber
set laststatus=2
set background=dark
set termguicolors
set backspace=indent,eol,start
set incsearch
set clipboard=unnamed
set hlsearch
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set wildmenu
set ignorecase
set smartcase
set autochdir
set cursorline
set showmode
set showcmd
" 检测文件类型
filetype on
" 针对不同的文件类型才用不同的缩紧方式
filetype indent on
" 去掉援助界面
set shortmess=atI
" 打开鼠标模式
set mouse-=a
set selection=exclusive
set selectmode=mouse,key
" 括号配对
set showmatch
set ruler


" 主题设置 这里用的是neodark的主题
" let g:molokai_original = 1
colorscheme neodark 
let g:neodark#use_256color = 1 "default:0
let g:neodark#solid_vertsplist = 1 "default : 0
let g:lightline = {}

" disable ominicomplete preview
set completeopt-=preview


" 每次打开定位到上次打开的位置
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" encoding
set fencs=utf-8,usc-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8



" nerdtree-git-plugin插件设置
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


" indentline插件设置
let  g:indentLine_setColors = 0
let  g:indentLine_color_term = 239
let  g:indentLine_char = 'c'
let  g:indentLine_char_list = ['|', '¦', '┆', '┊']

" nerdtree插件管理
" 自动打开nerdtree插件左侧
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" ctrl+n 打开nerdtree
nmap <F2> :NERDTreeToggle<CR>
" 关闭vim后自动关闭nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"和编辑文件一样，通过h j k l移动光标定位
"打开关闭文件或者目录，如果是文件的话，光标出现在打开的文件中
"go 效果同上，不过光标保持在文件目录里，类似预览文件内容的功能
"i和s可以水平分割或纵向分割窗口打开文件，前面加g类似go的功能
"t 在标签页中打开
"T 在后台标签页中打开
"ctrl+w+w 光标在左右窗口切换
"ctrl+w+r 切换当前窗口左右布局
"ctrl+p 模糊搜索文件
"gT 切换到前一个tab
"g t 切换到后一个tab
"p 到上层目录
"P 到根目录
"K 到同目录第一个节点
"J 到同目录最后一个节点
"m 显示文件系统菜单（添加、删除、移动操作）
"r: 刷新光标所在的目录
"R: 刷新当前根路径
"? 帮助
"q 关闭


" tagbar设置
" let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_right = 1
nmap <F3> :TagbarToggle<CR>


" limelight 与 goyo插件设置 :Goyo进入禅模式
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)
"进入goyo模式后自动触发limelight,推出则自动关闭
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" <F4>自动进入zen模式
nmap <F4> :Goyo<CR>

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'Gray'
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" 包含的前后段的数量
let g:limelight_paragraph_span = 1
" Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1


function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
