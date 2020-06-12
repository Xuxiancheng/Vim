" 基础设置
syntax enable
set nonu
set nocompatible
set number
"相对行号
set relativenumber
set laststatus=2
set background=dark
"set termguicolors
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
set cursorcolumn
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

autocmd ColorScheme janah highlight Normal ctermbg=235

"#############################################

" 主题设置 这里用的是neodark的主题
" let g:molokai_original = 1
colorscheme neodark 
let g:neodark#background = '#202020'
let g:neodark#use_256color = 1 " default: 0
let g:neodark#terminal_transparent = 1 " default: 0
let g:lightline = {}
let g:lightline.colorscheme = 'neodark'

"#############################################

" disable ominicomplete preview
set completeopt-=preview


" 每次打开定位到上次打开的位置
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
"############################################

" encoding 编码
set fencs=utf-8,usc-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

"############################################

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
let  g:indentLine_enabled = 1
let  g:indentLine_setColors = 0
let  g:indentLine_color_term = 239
let  g:indentLine_char = 'c'
let  g:indentLine_char_list = ['|', '¦', '┆', '┊']
let  g:indentLine_concealcursor = 'inc'
let  g:indentLine_conceallevel = 2

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

"##############################################


" tagbar设置
" let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_right = 1
nmap <F3> :TagbarToggle<CR>

"#############################################  

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

"#########################################################

" markdown 插件
let g:markdown_fenced_languages = ['java', 'python', 'bash=sh']
let g:markdown_syntax_conceal = 0
let g:markdown_minlines = 100

" markdwon 预览
"mac /Applications/Firefox.app/Contents/MacOS/firefox
let g:mkdp_path_to_chrome = "/Applications/Firefox.app/Contents/MacOS/firefox"
" 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）
" 如果设置了该参数, g:mkdp_browserfunc 将被忽略
let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
" vim 回调函数, 参数为要打开的 url
let g:mkdp_auto_start = 0
" 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
" markdown 文件的时候打开一次
let g:mkdp_auto_open = 0
" 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预
" 览窗口
let g:mkdp_auto_close = 1
" 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
" 自动关闭预览窗口
let g:mkdp_refresh_slow = 0
" 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
" 更新预览
let g:mkdp_command_for_global = 0
" 设置为 1 则所有文件都可以使用 MarkdownPreview 进行预览，默认只有 markdown
" 文件可以使用改命令
let g:mkdp_open_to_the_world = 0
" 设置为 1, 在使用的网络中的其他计算机也能访问预览页面
" 默认只监听本地（127.0.0.1），其他计算机不能访问

nmap <silent> <F8> <Plug>MarkdownPreview        " 普通模式
imap <silent> <F8> <Plug>MarkdownPreview        " 插入模式
nmap <silent> <F9> <Plug>StopMarkdownPreview    " 普通模式
imap <silent> <F9> <Plug>StopMarkdownPreview    " 插入模式

" 自定义函数 F5自动运行程序
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
   	exec "w"
   	if &filetype == 'c'
   		exec "!gcc % -o %<"
   		exec "!time ./%<"
   	elseif &filetype == 'cpp'
   		exec "!g++ % -o %<"
   		exec "!time ./%<"
   	elseif &filetype == 'java'
   		exec "!javac %"
   		exec "!time java %<"
   	elseif &filetype == 'sh'
   		:!time bash %
   	elseif &filetype == 'python'
   		exec "!time python3.8 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
     	endif
endfunc

" syntastic  代码检查设置
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" 常用的方法 
" :Errors 显示错误面板
":lnext  到下一个错误
":lprevious 到上一个错误


" startify 配置
"设置书签
"let g:startify_bookmarks            = [
"            \ '~/Project/test.cpp',
"            \]
"起始页显示的列表长度
let g:startify_files_number = 20
"自动加载session
let g:startify_session_autoload = 1
"过滤列表，支持正则表达式
let g:startify_skiplist = [
       \ '^/tmp',
       \ ]
"自定义Header和Footer
let g:startify_custom_header = [
            \ '+------------------------------+',
            \ '|                              |',
            \ '|    Still waters run deep!    |',
            \ '|                              |',
            \ '+----------------+-------------+',
            \]
let g:startify_custom_footer = [
            \ '+------------------------------+',
            \ '|     Keep an open mind!       |',
            \ '+----------------+-------------+',
            \]


" fzf设置
set rtp+=/usr/local/opt/fzf
