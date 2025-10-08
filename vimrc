vim9script

# ----------------------------------------------------------------------
# Setup
#

g:mapleader      =  "\<Space>"
g:maplocalleader =  "\,"

# ----------------------------------------------------------------------
# Opts
#

set autoindent
set autoread
set autowrite
set breakindent
set clipboard=unnamedplus
set cursorline
set expandtab
set ignorecase
set incsearch
set infercase
set linebreak
set list
set mouse=a
set number
set relativenumber
set noruler
set scrolloff=8
set expandtab
set shiftround
set shiftwidth=4
set noshowcmd
set noshowmode
set sidescrolloff=24
set laststatus=0
set signcolumn=no
set smartcase
set smartindent
set smoothscroll
set splitbelow
set splitkeep=screen
set splitright
set noswapfile
set switchbuf=usetab
set tabstop=4
set termguicolors
set timeoutlen=1000
set ttimeoutlen=10
set undofile
set undolevels=10000
set updatetime=300
set virtualedit=block
set winminwidth=5
set hlsearch
set nowrap
set nowritebackup
set shortmess-=S
set shortmess+=WcCat

# ----------------------------------------------------------------------
# Plug
#

call plug#begin()

Plug 'habamax/vim-dir'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/seoul256.vim'
Plug 'yegappan/lsp'
Plug 'habamax/vim-shout'

call plug#end()
