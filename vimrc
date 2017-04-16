"shell=/bin/bash
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
      echo "Installing Vundle.."
      echo ""
      silent !mkdir -p ~/.vim/bundle
      silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
      let iCanHazVundle=0
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Plugin 'gmarik/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'maksimr/vim-jsbeautify'
"Plugin 'einars/js-beautify'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/PDV--phpDocumentor-for-Vim'
Plugin 'tpope/vim-fugitive'
"source ~/.vim/vimrc.vundle 
Plugin 'fatih/vim-go'
"Plugin 'Shougo/neocomplete'
"Plugin 'Shougo/neosnippet'
"Plugin 'Shougo/neosnippet-snippets'
"Plugin 'shawncplus/phpcomplete.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'
"Plugin 'rizzatti/dash.vim'
"Plugin 'xolox/vim-easytags'
"Plugin 'xolox/vim-misc'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'posva/vim-vue'
Plugin 'mileszs/ack.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

"旧版本不兼容
if v:version > 703
    Plugin 'Valloric/YouCompleteMe'
endif
filetype plugin indent on  

set bs=indent,eol,start	" allow backspacing over everything in insert mode
set history=100		" keep 100 lines of command line history
set ruler			" show the cursor position all the time
set ar				" auto read when file is changed from outside
set nu				" show line numbers

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost .gvimrc source ~/.gvimrc

syntax on			" syntax highlight
set hlsearch		" search highlighting

" terminal color settings
"colorscheme desert
if has("gui_running")   " GUI color and font settings
    set guifont=Monaco:h14
    set background=dark 
    set cursorline  " highlight current line
    highlight CursorLine  guibg=#003853 ctermbg=24  gui=none cterm=none
    colors solarized
else
    set t_Co=256        " 256 color mode
    let g:solarized_termcolors=256
    set background=dark
    colors solarized
endif


set clipboard=unnamed	" yank to the system register (*) by default
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu		" wild char completion menu

" ignore these files while expanding wild chars
set wildignore+=.svn,CVS,.git 
set wildignore+=*.o,*.a,*.class,*.mo,*.la,*.so,*.lo,*.la,*.obj,*.pyc
set wildignore+=*.exe,*.zip,*.jpg,*.png,*.gif,*.jpeg 

set autoindent		" auto indentation
set incsearch		" incremental search
set backup			" save backup files
set backupdir=~/.vim/bak	" where to put backup file
set dir=~/.vim/tmp	" tell vim where to put swap files
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set nosmarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells visualbell t_vb=
set tm=500

" TAB setting
" set noexpandtab		"DO-NOT replace <TAB> with spaces
set expandtab		"replace <TAB> with spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4

"---------------------------------------------
" copy to system buffer
"---------------------------------------------
vnoremap <C-S-C> "+y<CR>
map <C-S-c>  "+y<CR>
map <C-S-v> "+p<CR>

"--------------------------------------------------------------------------- 
" ENCODING SETTINGS
"--------------------------------------------------------------------------- 
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,big5,latin1

" status line
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w
"set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.30(%{CurDir()}%)\ 
"set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L
set statusline+=\ \ \ %l/%L    " Current line
set statusline+=\ \ \ \ \ \ %{strftime(\"%I:%M:%S\ %b-%d\")}%=Page\%N

fun! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfun

fun! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfun

"--------------------------------------------------------------------------- 
" USEFUL SHORTCUTS
"--------------------------------------------------------------------------- 
" set leader to ;
let mapleader=";"
let g:mapleader=";"

"清除高亮
nmap <leader>h :noh<CR>


"--------------------
" For phpDocumentor (pdv)
"--------------------
inoremap <leader>pd <ESC>:call PhpDocSingle()<CR>i 
nnoremap <leader>pd :call PhpDocSingle()<CR> 
vnoremap <leader>pd :call PhpDocRange()<CR> 

"注释插件
let g:DoxygenToolkit_commentType ="php"
let g:DoxygenToolkit_briefTag_funcName= "no"
let g:doxygen_enhanced_color=1
let g:DoxygenToolkit_briefTag_pre="" 
let g:DoxygenToolkit_paramTag_pre="@param " 
let g:DoxygenToolkit_returnTag="@return " 
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------" 
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
let g:DoxygenToolkit_authorName="Liaoliang" 
let g:DoxygenToolkit_licenseTag="Mit"
let g:DoxygenToolkit_throwTag_pre = "@throw "

"禁止ctrl+v变成粘贴
noremap <C-V> <C-V>"

"" --- NERDTree
nnoremap <silent> <F9> :NERDTreeTabsToggle<CR>
nnoremap <leader>n :NERDTreeTabsToggle<CR>
" Close vim if the only window left open is the NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"" tagbar
nnoremap <silent> <F7> :TagbarToggle<CR>
let g:tagbar_autofocus = 1 " 打开tagbar的时候，光标自动聚焦到tagbar上面
let g:tagbar_autoclose = 0 " 打按回车，跳到某个方法后，自动关闭tagbar

" --- Syntastic
nnoremap <silent> <F6> :SyntasticCheck<CR>
nnoremap <leader>sy :SyntasticCheck<CR>
let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_jump = 1
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_quiet_messages = { "level": "warning" }
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

"禁用自动补全提示窗口
set completeopt-=preview

"禁用newline at end of file
"以免跟其他人使用的其他编辑器冲突
"autocmd FileType php setlocal noeol binary fileformats+=dos

autocmd FileType php setlocal omnifunc=phpcd#CompletePHP


let g:easytags_async = 1
"set transparency=8

" php-cs-fixer
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
let g:ycm_server_python_interpreter = '/usr/bin/python'

" ack用ag搜索
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

 let $PATH = '/usr/local/bin:'.$PATH
