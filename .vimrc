" {{{
" DesCRiption: 适合自己使用的vimrc文件，for Linux/Windows, GUI/Console
" Last Change: 2011-09-01
" Author:      Asins - asinsimple AT gmail DOT com
"              Get latest vimrc from http://nootn.com/lab/vim
" Version:     2.5.2
"}}}

" 设置leader为,
let mapleader=","
let g:mapleader=","

" 关闭 vi 兼容模式
set nocompatible
" 自动语法高亮
syntax on
" 检测文件类型
filetype on
" 检测文件类型插件
filetype plugin on
"cindent
set cindent
set shiftwidth=4
" 不设定在插入状态无法用退格键和 Delete 键删除回车符
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
" 显示行号
set number
" 上下可视行数
set scrolloff=6
" 设定 tab 长度为 4
set tabstop=4
" 设置按BackSpace的时候可以一次删除掉4个空格
set softtabstop=4
" 设定 << 和 >> 命令移动时的宽度为 4
set shiftwidth=4
"set smarttab
set history=1024
" 不突出显示当前行
set nocursorline
" 覆盖文件时不备份
set nobackup
" 自动切换当前目录为当前文件所在的目录
set autochdir
" 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set ignorecase
set smartcase
" 搜索到文件两端时不重新搜索
set nowrapscan
" 实时搜索
set incsearch
" 搜索时高亮显示被找到的文本
set hlsearch
" 关闭错误声音
set noerrorbells
set novisualbell
set t_vb=

" 不自动换行
"set nowrap
"How many tenths of a second to blink
set mat=2
" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set hidden
" 智能自动缩进
"set smartindent
" 设定命令行的行数为 2 
set cmdheight=2
" 显示状态栏 (默认值为 1, 无法显示状态栏)
set laststatus=2
"显示括号配对情况
set showmatch

" 解决自动换行格式下, 如高度在折行之后超过窗口高度结果这一行看不到的问题
set display=lastline
" 设定配色方案
colorscheme slate
" 设置在状态行显示的信息
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)

" 显示Tab符
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"启动时不显示 捐赠提示
set shortmess=atl

"blank      空白
"buffers    缓冲区
"curdir     当前目录
"folds      折叠
"help       帮助
"options    选项
"tabpages   选项卡
"winsize    窗口大小
"slash      转换文件路径中的\为/以使session文件兼容unix
"unix       设置session文件中的换行模式为unix
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize

" {{{ 开始折叠
set foldenable
" 设置语法折叠
" manual  手工定义折叠
" indent  更多的缩进表示更高级别的折叠
" expr    用表达式来定义折叠
" syntax  用语法高亮来定义折叠
" diff    对没有更改的文本进行折叠
" marker  对文中的标志折叠
set foldmethod=indent
"折叠相关的快捷键
"zR 打开所有的折叠
"za Open/Close (toggle) a folded group of lines.
"zA Open a Closed fold or close and open fold recursively.
"zi 全部 展开/关闭 折叠
"zo 打开 (open) 在光标下的折叠
"zc 关闭 (close) 在光标下的折叠
"zC 循环关闭 (Close) 在光标下的所有折叠
"zM 关闭所有可折叠区域
" 设置折叠区域的宽度
set foldcolumn=0
" 设置折叠层数为
setlocal foldlevel=1
" 新建的文件，刚打开的文件不折叠
autocmd! BufNewFile,BufRead * setlocal nofoldenable
" }}}

" Alt-W切换自动换行
noremap <a-w> :exe &wrap==1 ? 'set nowrap' : 'set wrap'<cr>

" 选中状态下 Ctrl+c 复制
vnoremap <c-c> "+y

" Shift + Delete 插入系统剪切板中的内容
noremap <S-Del> "+p
inoremap <S-Del> <esc>"+pa
vnoremap <S-Del> d"+P

"设置代码折叠方式为 手工  indent
"set foldmethod=indent
"设置代码块折叠后显示的行数
set foldexpr=1

if has("gui_running")
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    set showtabline=0 " 隐藏Tab栏
endif

"编辑vim配置文件
if has("unix")
    set fileformats=unix,dos,mac
    nmap <leader>e :tabnew $HOME/.vimrc<cr>
    let $VIMFILES = $HOME."/.vim"
else
    set fileformats=dos,unix,mac
    nmap <leader>e :tabnew $VIM/_vimrc<cr>
    let $VIMFILES = $VIM."/vimfiles"
endif

" Alt-Space is System menu
if has("gui")
  noremap <m-space> :simalt ~<cr>
  inoremap <m-space> <c-o>:simalt ~<cr>
  cnoremap <m-space> <c-c>:simalt ~<cr>
"  colorscheme torte
endif

" 设定doc文档目录
let helptags=$VIMFILES."/doc"
set helplang=cn
"set nobomb

" {{{ 编码字体设置
"   if has("multi_byte")
"     set encoding=unicode
"     let &termencoding = &encoding
"     " Set default encoding as UTF-8 with not BOM
"     setglobal fileencoding=utf-8 bomb
"     " Auto detect the file encoding BOM unicode, utf-8, GBK, Big5, Latin1
"     set fileencodings=ucs-bom,utf-8,cp936,cp950,latin1
"
"     " Walkaround the encoding problem for fenc=utf-8 && enc=ucs-2
"     augroup i18n
"         autocmd!
"         autocmd BufReadPost * if &fileencoding == "utf-8" | let &encoding = &fileencoding | endif
"     augroup END
"   endif

set fileencodings=utf-8,cp936,cp950,latin1
set ambiwidth=double
set guifont=Liberation\ Mono\ 10
" }}}

" {{{全文搜索选中的文字
vnoremap <silent> <leader>f y/<c-r>=escape(@", "\\/.*$^~[]")<cr><cr>
vnoremap <silent> <leader>F y?<c-r>=escape(@", "\\/.*$^~[]")<cr><cr>
" }}}

" 删除所有行未尾空格
nnoremap <f12> :%s/[ \t\r]\+$//g<cr>

" 窗口切换
nnoremap <s-h> <c-w>h
nnoremap <s-l> <c-w>l
nnoremap <s-j> <c-w>j
nnoremap <s-k> <c-w>k

" Buffers/Tab操作快捷方式!
nnoremap <c-j> :bprevious<cr>
nnoremap <c-k> :bnext<cr>
nnoremap <c-l> :tabnext<cr>
nnoremap <c-h> :tabprev<cr>
nnoremap <c-t> :tabnew .<cr>
nnoremap <c-c> :tabc<cr>

" 插入模式下上下左右移动光标
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-j> <c-o>gj
inoremap <c-k> <c-o>gk

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
nnoremap <leader>11 :set filetype=xhtml<cr>
nnoremap <leader>22 :set filetype=css<cr>
nnoremap <leader>33 :set filetype=javascript<cr>
nnoremap <leader>44 :set filetype=php<cr>

" VimWiki
map <leader>tt <Plug>VimwikiToggleListItem
let g:vimwiki_list = [{'path': '/var/www/personalwiki/vimwiki','path_html': '/var/www/personalwiki/html',
					\  'template_path': '~/.vim/autoload/vimwiki/',
					\  'template_default': 'mystyle',
					\  'template_ext': '.tpl',
					\  'auto_export':1},
					\ {'path': '~/sourcecode/websiteSource/publicWiki', 'path_html': '~/happily84.github.com/wiki',
					\  'template_path': '~/happily84.github.com/wiki/template/',
					\  'template_default': 'default',
					\  'template_ext': '.tpl',
					\  'auto_export':1},
					\ {'path': '~/sourcecode/websiteSource/weblog', 'path_html': '~/happily84.github.com/blog',
					\  'template_path': '~/happily84.github.com/blog/template/',
					\  'template_default': 'default',
					\  'template_ext': '.tpl',
					\  'auto_export':1}]

map <F8> :Calendar<cr>
" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
let g:vimwiki_camel_case = 0
 
" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1
   
" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
let g:vimwiki_menu = ''
    
" 是否开启按语法折叠  会让文件比较慢
"let g:vimwiki_folding = 1
    
" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1
let g:vimwiki_valid_html_tags='b,a,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1,img'

"enable using mouse
"set mouse=a

"vim zen-coding
let g:user_zen_expandabbr_key='<c-e>' "use ctrl+e to use zencoding auto abbr expand

"for vim-latex
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

set iskeyword+=:

let g:Tex_ViewRule_dvi = 'kdvi'
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_ViewRule_ps = 'evince'

let g:Tex_compileRule_ps = 'dvips -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'

"==========================================================
map <silent><F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

"进行Tlist的设置
"TlistUpdate可以更新tags
noremap <silent> <leader>l :TlistToggle<CR> "按下,l就可以呼出了
let Tlist_Auto_Open=1
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=0 "是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0

" about DoxygenToolKit
map <F3>l :DoxLic <Enter>
map <F3>a :DoxAuthor
map <F3>f :Dox <Enter>
map <F3>b :DoxBlock <Enter>
map <F3>c O/** */<Left><Left>

" DoxygenToolKit setting
let g:DoxygenToolkit_authorName = "happily84@gmail.com"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
let g:DoxygenToolkit_licenseTag="My own license\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30

"ctags setting
set tags=/usr/include/tags,./tags

"omnicomplete
set completeopt=longest,menu
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-P>"

"quickfix
map <silent><leader>oe :copen<CR>
map <silent><leader>ce :cclose<CR>
map <F6> :cclose<CR>
map <silent><leader>ne :cn<CR>
map <silent><leader>pe :cp<CR>
map <F5> <ESC>:w<CR>:make clean<CR><CR>:make<CR><CR>:cw<CR><C-W>k 
map <c-n> :cn<CR> 
map <c-m> :cp<CR> 

" ======= 编译 && 运行 ======= " 
if filereadable( "Makefile" ) || filereadable( "makefile" ) 
   set makeprg=make 
else 
   set makeprg=gcc\ %\ -Wall\ -o\ %< 
endif 

au syntax * cal rainbow#activate()
let g:enable_warning=1

"For fast complie a latex file
command! Tex call Tex()
function! Tex()
	w
	!latex %
	silent !dvipdfmx %:r
	silent !evince %:r.pdf
endfunction
