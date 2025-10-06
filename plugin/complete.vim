vim9script

#  ----------------------------------------------------------------------
#  Command line autocomplete

set completeopt=menuone,noselect,noinsert,fuzzy,nosort
set completefuzzycollect=keyword,files,whole_line
set pummaxwidth=100
set wildoptions=pum,fuzzy
set wildignore+=.DS_Store
set wildignorecase
set wildmode=noselect:lastused,full
set wildmenu
set complete=.,o
set completeopt=popup

augroup CmdlineComplete
    au!
    au CmdlineChanged [:/\?] call wildtrigger()
augroup END

cnoremap <expr> <left> wildmenumode() ? "\<C-e>\<left>" : "\<left>"
cnoremap <expr> <down> wildmenumode() ? "\<C-e>\<down>" : "\<down>"
cnoremap <expr> <up> wildmenumode() ? "\<C-e>\<up>" : "\<up>"
cnoremap <expr> <right> wildmenumode() ? "\<C-e>\<right>" : "\<right>"

cnoremap <expr> <m-h> wildmenumode() ? "\<C-e>\<left>" : "\<left>"
cnoremap <expr> <m-j> wildmenumode() ? "\<C-e>\<down>" : "\<down>"
cnoremap <expr> <m-k> wildmenumode() ? "\<C-e>\<up>" : "\<up>"
cnoremap <expr> <m-l> wildmenumode() ? "\<C-e>\<right>" : "\<right>"
