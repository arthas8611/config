"----------------------------------------------------------------
" map keys
let mapleader=" " 
nnoremap ; :
nnoremap s <nop>
nnoremap S :w<CR>
nnoremap Q :q<CR>
nnoremap R :source $MYVIMRC<CR>
set gfn=Menlo-Regular:h24

nnoremap = nzz
nnoremap - Nzz
nnoremap <LEADER><CR> :nohlsearch<CR>

map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitright<CR>:split<CR>

map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>
"----------------------------------------------------------------

set nocompatible            " 关闭 vi 兼容模式
syntax on                   " 自动语法高亮
colorscheme murphy          " 设定配色方案
set showcmd
set wildmenu
set number                  " 显示行号
set cursorline              " 突出显示当前行
set ruler                   " 打开状态栏标尺
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set nobackup                " 覆盖文件时不备份
set autochdir               " 自动切换当前目录为当前文件所在的目录

"--set for search highlight---------------------------
set hlsearch                " 搜索时高亮显示被找到的文本
exec "nohlsearch"
set incsearch               " 输入搜索内容时就显示搜索结果
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on   " 开启插件

set backupcopy=yes          " 设置备份时的行为为覆盖
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫

set t_vb=                   " 置空错误铃声的终端代码

" set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号

" set matchtime=2             " 短暂跳转到匹配括号的时间

set magic                   " 设置魔术

set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存

set guioptions-=T           " 隐藏工具栏

set guioptions-=m           " 隐藏菜单栏

set smartindent             " 开启新行时使用智能自动缩进

set backspace=indent,eol,start

                            " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)

set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 

                            " 设置在状态行显示的信息

set foldenable              " 开始折叠

set foldmethod=syntax       " 设置语法折叠

set foldcolumn=0            " 设置折叠区域的宽度

setlocal foldlevel=1        " 设置折叠层数为

" set foldclose=all           " 设置为自动关闭折叠                            

" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

                            " 用空格键来开关折叠



" return OS type, eg: windows, or linux, mac, et.st..

function! MySys()

    if has("win16") || has("win32") || has("win64") || has("win95")

        return "windows"

    elseif has("unix")

        return "linux"

    endif

endfunction



" 用户目录变量$VIMFILES

if MySys() == "windows"

    let $VIMFILES = $VIM.'/vimfiles'

elseif MySys() == "linux"

    let $VIMFILES = $HOME.'/.vim'

endif



" 设定doc文档目录

let helptags=$VIMFILES.'/doc'



" 设置字体 以及中文支持

if has("win32")

    set guifont=Inconsolata:h12:cANSI

endif



" 配置多语言环境

if has("multi_byte")

    " UTF-8 编码

    set encoding=utf-8

    set termencoding=utf-8

    set formatoptions+=mM

    set fencs=utf-8,gbk



    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'

        set ambiwidth=double

    endif



    if has("win32")

        source $VIMRUNTIME/delmenu.vim

        source $VIMRUNTIME/menu.vim

        language messages zh_CN.utf-8

    endif

else

    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"

endif



" Buffers操作快捷方式!

nnoremap <C-RETURN> :bnext<CR>

nnoremap <C-S-RETURN> :bprevious<CR>



" Tab操作快捷方式!

nnoremap <C-TAB> :tabnext<CR>

nnoremap <C-S-TAB> :tabprev<CR>



"关于tab的快捷键

" map tn :tabnext<cr>

" map tp :tabprevious<cr>

" map td :tabnew .<cr>

" map te :tabedit

" map tc :tabclose<cr>



"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动

"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的

"时候会变得非常方便.

nnoremap <C-h> <C-w>h

nnoremap <C-j> <C-w>j

nnoremap <C-k> <C-w>k

nnoremap <C-l> <C-w>l

"----------------------------------------------------------------
map rr :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -p%<"
		exec "!time ./%<"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'html'
		exec "!firefox % &"
	endif
endfunc
"----------------------------------------------------------------

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）

nnoremap <leader>1 :set filetype=xhtml<CR>

nnoremap <leader>2 :set filetype=css<CR>

nnoremap <leader>3 :set filetype=javascript<CR>

nnoremap <leader>4 :set filetype=php<CR>



" set fileformats=unix,dos,mac

" nmap <leader>fd :se fileformat=dos<CR>

" nmap <leader>fu :se fileformat=unix<CR>



" use Ctrl+[l|n|p|cc] to list|next|previous|jump to count the result

" map <C-x>l <ESC>:cl<CR>

" map <C-x>n <ESC>:cn<CR>

" map <C-x>p <ESC>:cp<CR>

" map <C-x>c <ESC>:cc<CR>


"----------------------------------------------------------------
source ~/.vim/snippits.vim
"----------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Markdow preview
Plug 'iamcco/markdown-preview.nvim'



call plug#end()

"----------------------------------------------------------------
