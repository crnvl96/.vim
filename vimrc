vim9script

g:mapleader = "\<Space>"
g:maplocalleader = "\,"

colorscheme default

source $VIMRUNTIME/defaults.vim
autocmd! vimHints

filetype plugin indent on
syntax on

set autoindent
set autoread
set autowrite
set breakindent
set clipboard=unnamed
set cmdheight=1
set completefuzzycollect=keyword,files,whole_line
set completeopt=menuone,noinsert,fuzzy,nosort
set confirm
set cursorline
set cursorlineopt=number
set diffopt=internal,filler,closeoff,algorithm:histogram,linematch:60,indent-heuristic,vertical,context:99
set expandtab
set foldcolumn=0
set foldlevel=99
set foldlevelstart=99
set foldmethod=indent
set foldnestmax=10
set foldtext=
set formatoptions=jcroqlnt
set shiftwidth=4
set ignorecase
set infercase
set laststatus=0
set linebreak
set mouse=a
set nobackup
set nolist
set noruler
set noshowcmd
set noswapfile
set notermguicolors
set nowrap
set nowrap
set nowritebackup
set number
set relativenumber
set scrolloff=8
set shiftround
set shortmess=CFOSWIaco
set signcolumn=yes
set smartcase
set smartindent
set smoothscroll
set splitbelow
set splitkeep=screen
set splitright
set switchbuf=usetab
set tabstop=4
set timeoutlen=1000
set ttimeoutlen=10
set undofile
set undolevels=10000
set updatetime=300
set virtualedit=block
set wildignore+=.DS_Store
set wildignorecase
set winminwidth=5

# ----------------------------------------------------------------------
# Plug

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'habamax/vim-dir'

call plug#end()
