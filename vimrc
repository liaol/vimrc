set shell=/bin/bash
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
Plugin 'gmarik/vundle'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'majutsushi/tagbar'
"source ~/.vim/vimrc.vundle 
filetype plugin indent on  

set bs=indent,eol,start	" allow backspacing over everything in insert mode
set history=100		" keep 100 lines of command line history
set ruler			" show the cursor position all the time
set ar				" auto read when file is changed from outside
set nu				" show line numbers

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

syntax on			" syntax highlight
set hlsearch		" search highlighting

" terminal color settings
colorscheme desert

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
set noexpandtab		"DO-NOT replace <TAB> with spaces
set expandtab		"DO-NOT replace <TAB> with spaces
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

"注释插件
let g:DoxygenToolkit_commentType ="php"
let g:DoxygenToolkit_briefTag_funcName= "yes"
let g:doxygen_enhanced_color=1
let g:DoxygenToolkit_briefTag_pre="" 
let g:DoxygenToolkit_paramTag_pre="@param " 
let g:DoxygenToolkit_returnTag="@return " 
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------" 
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
let g:DoxygenToolkit_authorName="Liaol" 
let g:DoxygenToolkit_licenseTag="Mit"
"let g:DoxygenToolkit_throwTag_pre = "@throw "

"禁止ctrl+v变成粘贴
noremap <C-V> <C-V>"

" set leader to ;
let mapleader=";"
let g:mapleader=";"

"
"" --- NERDTree
nnoremap <silent> <F9> :NERDTreeTabsToggle<CR>
nnoremap <leader>n :NERDTreeTabsToggle<CR>
" Close vim if the only window left open is the NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"" tagbar
nmap <F7> :TagbarToggle<CR>
let g:tagbar_autofocus = 1 " 打开tagbar的时候，光标自动聚焦到tagbar上面
let g:tagbar_autoclose = 1 " 打按回车，跳到某个方法后，自动关闭tagbar


""" FocusMode
function! ToggleFocusMode()
    if (&foldcolumn != 12)
        set laststatus=0
        set numberwidth=10
        set foldcolumn=12
        set noruler
        hi FoldColumn ctermbg=none
        hi LineNr ctermfg=0 ctermbg=none
        hi NonText ctermfg=0
    else
        set laststatus=2
        set numberwidth=4
        set foldcolumn=0
        set ruler
        execute 'colorscheme ' . g:colors_name
    endif
endfunc
nnoremap <F8> :call ToggleFocusMode()<cr>

