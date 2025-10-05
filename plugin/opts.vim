vim9script

$PATH = $HOME .. '/.local/share/mise/installs/node/24.9.0/bin/' .. ':' .. $PATH

packadd comment
packadd nohlsearch
packadd hlyank
packadd matchit
packadd editorconfig

filetype plugin indent on
syntax on

source $VIMRUNTIME/defaults.vim
autocmd! vimHints

g:loaded_netrw = 1
g:loaded_netrwPlugin = 1

g:hlyank_hlgroup = "Pmenu"
g:hlyank_duration = 500

