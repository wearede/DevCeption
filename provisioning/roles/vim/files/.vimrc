" vim-plug (https://github.com/junegunn/vim-plug)
" Automatically install vim-plug and run PlugInstall if vim-plug not found

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

"*****************************************************************************
"" Plug install packages
"*****************************************************************************

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'tyrannicaltoucan/vim-quantum' " let g:quantum_black = 1
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-vinegar'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'valloric/matchtagalways'
Plug 'ap/vim-buftabline'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Initialize plugin system
call plug#end()

"*****************************************************************************
"" Visual Settings
"*****************************************************************************

set number
set ruler
set nowrap

set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:quantum_black = 1
silent! colorscheme quantum

"*****************************************************************************
"" Optimizations
"*****************************************************************************

set lazyredraw

let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

"*****************************************************************************
"" syntastic
"*****************************************************************************

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_exec = '/usr/local/bin/phpcs'
let g:syntastic_php_phpcs_args = '--standard=WordPress -n'
" let g:syntastic_debug = 3

" when opening files with :Ex or :Sex nertw uses full path
" this creates problem with docker and path inside containers
" settings bellow makes sure relative path to current buffer is used
" http://vi.stackexchange.com/a/655/10804
set autochdir
set browsedir=current

"*****************************************************************************
"" yank and cut to osx clipboard
"*****************************************************************************

"*****************************************************************************
"" indent
"*****************************************************************************

" tabs
set listchars=tab:˗\ ,eol:¬
set list

" spaces
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '·'
let g:indentLine_faster = 1

set tabstop=2
set softtabstop=2
set shiftwidth=2

filetype plugin indent on

set ai

" make < > indents keep selection
vnoremap < <gv
vnoremap > >gv

"*****************************************************************************
"" match tags
"*****************************************************************************

" enable plugin for matching tag highlighting
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'jinja' : 1, 'php': 1 }

" This plugin makes the % command jump to matching HTML tags, if/else/endif in Vim scripts, etc.
packadd! matchit

"*****************************************************************************
"" ctrlp
"*****************************************************************************

set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn))$'

"*****************************************************************************
"" buffers
"*****************************************************************************

noremap <Tab> :bnext<CR>
noremap <S-Tab> :bprevious<CR>

" noremap <C-w> :bd<CR> " interferes with ctrl+ww to navigate panes

" Switch buffers without saving to a currently modified file
set hidden

"*****************************************************************************
"" general
"*****************************************************************************

set encoding=utf8
set ffs=unix,dos,mac

" Set to auto read when a file is changed from the outside
set autoread

set backspace=indent,eol,start

" :h last-position-jump
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"*****************************************************************************
"" search
"*****************************************************************************

set ignorecase
set smartcase
set hlsearch
set incsearch

"*****************************************************************************
"" UltiSnips
"*****************************************************************************

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"

