let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
      echo "Installing Vundle.."
        echo ""
          silent !mkdir -p ~/.vim/bundle
            silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
              let iCanHazVundle=0
endif

" Use Vundle to manage bundles
"--------------------
set nocompatible	" be iMproved
filetype off		" required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'vim-scripts/DoxygenToolkit.vim'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
source ~/.vim/vimrc.vundle 
"call vundle#end()
"--------------------
" General Settings
"--------------------
set bs=indent,eol,start	" allow backspacing over everything in insert mode
set history=100		" keep 100 lines of command line history
set ruler			" show the cursor position all the time
set ar				" auto read when file is changed from outside
set nu				" show line numbers

filetype on			" Enable filetype detection
filetype indent on	" Enable filetype-specific indenting
filetype plugin on	" Enable filetype-specific plugins

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

syntax on			" syntax highlight
set hlsearch		" search highlighting

" terminal color settings
if has("gui_running")	" GUI color and font settings
	set guifont=Courier:h18
	set background=dark 
	set t_Co=256		" 256 color mode
	set cursorline	" highlight current line
	highlight CursorLine  guibg=#003853 ctermbg=24  gui=none cterm=none
	colors moria
else
	colors evening
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
"set noexpandtab		"DO-NOT replace <TAB> with spaces
set expandtab		"DO-NOT replace <TAB> with spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4



"--------------------------------------------------------------------------- 
" USEFUL SHORTCUTS
"--------------------------------------------------------------------------- 
" set leader to ;
let mapleader=";"
let g:mapleader=";"



"---------------------------------------------
" Enable omni completion. (Ctrl-X Ctrl-O)
"---------------------------------------------
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
	autocmd Filetype *
				\ if &omnifunc == "" |
				\   setlocal omnifunc=syntaxcomplete#Complete |
				\ endif
endif
set cot-=preview	"disable doc preview in omnicomplete

"---------------------------------------------
" for PHP programming
"---------------------------------------------
autocmd FileType php set makeprg=php\ -l\ %
autocmd FileType php set errorformat=%m\ in\ %f\ on\ line\ %l


"---------------------------------------------
" use w!! to write protected files
"---------------------------------------------
cmap w!! %!sudo tee > /dev/null % 

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


" --- TagBar
" toggle TagBar with F7 ;tb
nnoremap <silent><F7> :TagbarToggle<CR> 
nnoremap <leader>t :TagbarToggle<CR>
" set focus to TagBar when opening it
let g:tagbar_autofocus = 1
" set default width of the Tagbar window
let g:tagbar_width = 30
" markdown support
"let g:tagbar_type_markdown = {
"			\ 'ctagstype': 'markdown',
"			\ 'kinds': [ 'h:Heading_L1', 'i:Heading_L2', 'k:Heading_L3' ]
"			\ }
"" --- NERDTree
nnoremap <silent> <F9> :NERDTreeTabsToggle<CR>
nnoremap <leader>n :NERDTreeTabsToggle<CR>
" Close vim if the only window left open is the NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" --- neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
			\ 'default': '',
			\ 'vimshell': '~/.vimshell_hist',
			\ 'scheme': '~/.gosh_completions'
			\ }

"注释插件
let g:DoxygenToolkit_commentType ="php"
let g:DoxygenToolkit_briefTag_pre="@Synopsis  " 
let g:DoxygenToolkit_paramTag_pre="@Param " 
let g:DoxygenToolkit_returnTag="@Returns   " 
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------" 
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
let g:DoxygenToolkit_authorName="Liao" 
let g:DoxygenToolkit_licenseTag="Mit"

