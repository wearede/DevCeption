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
Plug 'aonemd/kuroi.vim' " set background=dark
Plug 'fatih/molokai'
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
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-rooter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'greymd/oscyank.vim'

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

set background=dark
silent! colorscheme kuroi

"*****************************************************************************
"" Optimizations
"*****************************************************************************

set lazyredraw

let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

"*****************************************************************************
"" Syntastic
"*****************************************************************************

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_debug = 3

" When opening files with :Ex or :Sex nertw uses full path
" this creates problem with docker and path inside containers
" settings bellow makes sure relative path to current buffer is used
autocmd BufReadPost * silent! lcd .

"*****************************************************************************
"" Indent
"*****************************************************************************

" Tabs
set listchars=tab:˗\ ,eol:¬
set list

" Spaces
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '·'
let g:indentLine_faster = 1

set tabstop=2
set softtabstop=2
set shiftwidth=2

filetype plugin indent on

set ai

" Make < > indents keep selection
vnoremap < <gv
vnoremap > >gv

"*****************************************************************************
"" Match tags
"*****************************************************************************

" Enable plugin for matching tag highlighting
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'jinja' : 1, 'php': 1 }

" This plugin makes the % command jump to matching HTML tags, if/else/endif in Vim scripts, etc.
packadd! matchit

"*****************************************************************************
"" Ctrlp
"*****************************************************************************

set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn))$'

"*****************************************************************************
"" Buffers
"*****************************************************************************

noremap <Tab> :bnext<CR>
noremap <S-Tab> :bprevious<CR>

" Switch buffers without saving to a currently modified file
set hidden

" Fixes netrw, buffers opened by - don’t get closed
" https://github.com/tpope/vim-vinegar/issues/13#issuecomment-489440040
let g:netrw_fastbrowse = 0

"*****************************************************************************
"" General
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
"" Search
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

"*****************************************************************************
"" YCM
"*****************************************************************************

" Disable Vim's preview window
" https://github.com/Valloric/YouCompleteMe#i-get-a-weird-window-at-the-top-of-my-file-when-i-use-the-semantic-engine
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

"*****************************************************************************
"" Gutentags
"*****************************************************************************

let g:gutentags_project_root = ['.gutctags']
let g:gutentags_add_default_project_roots = 0

"*****************************************************************************
"" VimAirline
"*****************************************************************************
"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"*****************************************************************************
"" Tagbar
"*****************************************************************************

nmap <F8> :TagbarToggle<CR>

"*****************************************************************************
"" OscYank - yank to OS clipboard, works with ssh
"*****************************************************************************

noremap <leader>y :Oscyank<CR>

