shell=/bin/bash
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/autoload/plug.vim')
if !filereadable(vundle_readme)
      echo "Installing Plug.."
      echo ""
      curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      let iCanHazVundle=0
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#rc()
call plug#begin()
Plug 'gmarik/Vundle.vim'
Plug 'gmarik/vundle'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'maksimr/vim-jsbeautify'
"Plun 'einars/js-beautify'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'majutsushi/tagbar'
"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'vim-scripts/PDV--phpDocumentor-for-Vim'
Plug 'tobyS/pdv'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
"Plug 'Shougo/neocomplete'
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'
Plug 'shawncplus/phpcomplete.vim'
"Plug 'Lokaltog/vim-powerline'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
"Plug 'rizzatti/dash.vim'
Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
"Plug 'kelevro/vim-easytags'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'posva/vim-vue'
Plug 'mileszs/ack.vim'
Plug 'editorconfig/editorconfig-vim'
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'
"Plug 'mattn/webapi-vim'
"Plug '7kfpun/finance.vim'
Plug 'justmao945/vim-clang'
Plug 'ShowTrailingWhitespace'
Plug 'thaerkh/vim-workspace'
"Plug 'joonty/vim-phpqa'
"Plug 'botvs/VimBotVS'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'



"旧版本不兼容
if v:version > 703
    Plug 'Valloric/YouCompleteMe'
endif
call plug#end()

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

"colorscheme
if has("gui_running")   " GUI color and font settings
    set guifont=Monaco:h14
    set background=dark
    set cursorline  " highlight current line
    highlight CursorLine  guibg=#003853 ctermbg=24  gui=none cterm=none
    "colors solarized
    colorscheme one
else
    set t_Co=256        " 256 color mode
    let g:solarized_termcolors=256
    set background=dark
    "colors solarized
    colorscheme one
endif
let g:airline_theme='one'


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
"set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w
set statusline=\ \ %<%f\ %h%m%r%{fugitive#statusline()}
"set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=%<%20.30(%{CurDir()}%)
"set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L
set statusline+=\ \ \ %F
set statusline+=\ \ \ %l/%L    " Current line
"set statusline+=\ \ \ \ \ \ %{strftime(\"%I:%M:%S\ %b-%d\")}
"set statusline+=\ \ \ %{ALEGetStatusLine()}
"set statusline+=%=Page\%N


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
"nnoremap <leader>n :NERDTreeTabsToggle<CR>
" Close vim if the only window left open is the NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:nerdtree_tabs_open_on_gui_startup = 0 " macvim打开时不要自动启动nerdtree

"" tagbar
nnoremap <silent> <F7> :TagbarToggle<CR>
let g:tagbar_autofocus = 1 " 打开tagbar的时候，光标自动聚焦到tagbar上面
let g:tagbar_autoclose = 0 " 打按回车，跳到某个方法后，自动关闭tagbar

" --- Syntastic
"nnoremap <silent> <F6> :SyntasticCheck<CR>
"nnoremap <leader>sy :SyntasticCheck<CR>
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_auto_jump = 1
"let g:syntastic_php_checkers = ['php']
"let g:syntastic_quiet_messages = { "level": "warning" }
"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" golang插件
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
autocmd FileType php set nofixendofline
autocmd FileType php setlocal omnifunc=phpcd#CompletePHP


"let g:easytags_async = 1
"let g:easytags_auto_highlight=0
"let g:easytags_dynamic_files = 2 "按项目生成.tag文件 避免全局tag文件过大

"set transparency=5 "透明度

" php-cs-fixer
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><F10>  :call PhpCsFixerFixFile()<CR>

" ycm补全
let g:ycm_server_python_interpreter = '/usr/bin/python'

" ack用ag搜索
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let $PATH = '/usr/local/bin:'.$PATH

" ale语法检查START
let g:ale_sign_column_always = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 0
let g:ale_completion_enabled = 1

" 自动跳转的错误行
fun! GotoALEPrevious()
    ALEPreviousWrap
endfun

augroup YourGroup
    autocmd!
    "autocmd User ALE call GotoALEPrevious()
    autocmd User ALELintPost call GotoALEPrevious()
augroup END

"let g:ale_linters = { 'javascript': [''], 'html': [], 'lua': ['luacheck -g'], 'go': ['gopls'] }
let g:ale_linters = { 'javascript': [''], 'html': [], 'lua': ['luacheck -g'], 'go': ['goimport'] }
" ALE语法检查STOP


" xolox/vim-session设置
"set sessionoptions-=options
"let g:session_autosave_to = 'default'
"let g:session_autosave = 'yes'
"let g:session_autoload = 'yes'

"let g:finance_watchlist = ['1357.HK']
"let g:finance_format = '{symbol}: {LastTradePriceOnly} {Change} {ChangeinPercent}'

" 加上这句 php的switch缩进就没问题了
let g:PHP_vintage_case_default_indent = 1

set tags=.tags

" workspace设置
"nnoremap <leader>s :ToggleWorkspace<CR>
let g:workspace_session_name = '.session.vim'
let g:workspace_autosave = 1

"ultisnips设置
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="/Users/liao/.vim/UltiSnips"

" Save session on quitting Vim
autocmd VimLeave * NERDTreeClose

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
