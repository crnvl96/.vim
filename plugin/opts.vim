vim9script

# ----------------------------------------------------------------------
# Path
#

$PATH = $HOME .. '/.local/share/mise/installs/node/24.9.0/bin/' .. ':' .. $PATH

# ----------------------------------------------------------------------
# Plugins (builtin)
#

packadd comment
packadd nohlsearch
packadd hlyank
packadd matchit
packadd editorconfig

g:hlyank_hlgroup = "Pmenu"
g:hlyank_duration = 500

# ----------------------------------------------------------------------
# Utils
#

filetype plugin indent on
syntax on

source $VIMRUNTIME/defaults.vim
autocmd! vimHints

g:loaded_netrw = 1 # Disable netrw
g:loaded_netrwPlugin = 1 # Disable netrw
