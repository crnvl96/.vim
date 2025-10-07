vim9script

# ----------------------------------------------------------------------
# Keymaps

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <c-left>  :vertical resize -20<cr>
nnoremap <c-down>  :resize -5<cr>
nnoremap <c-up>    :resize +5<cr>
nnoremap <c-right> :vertical resize +20<cr>

nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz

xnoremap < <gv
xnoremap > >gv

xnoremap p P

nnoremap Y yg_
xnoremap Y yg_
onoremap Y yg_

nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
xnoremap <expr> j v:count == 0 ? 'gj' : 'j'

nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
xnoremap <expr> k v:count == 0 ? 'gk' : 'k'

nnoremap <expr> <esc> :noh<esc>
snoremap <expr> <esc> :noh<esc>
inoremap <expr> <esc> :noh<esc>

nnoremap <expr> n  'Nn'[v:searchforward]
xnoremap <expr> n  'Nn'[v:searchforward]
onoremap <expr> n  'Nn'[v:searchforward]

nnoremap <expr> N  'nN'[v:searchforward]
xnoremap <expr> N  'nN'[v:searchforward]
onoremap <expr> N  'nN'[v:searchforward]

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ; ;<c-g>u

nnoremap <c-s> :noh<cr><esc>:write!<cr><esc>
xnoremap <c-s> :noh<cr><esc>:write!<cr><esc>
inoremap <c-s> :noh<cr><esc>:write!<cr><esc>

nnoremap < :cprev<cr>
nnoremap > :cnext<cr>

nnoremap - :Dir<cr>

def ToggleQuickfix(): string
    if getqflist({'winid': 0}).winid != 0
        return 'cclose'
    else
        return 'copen'
    endif
enddef


nnoremap H mzgggqG`z:delmarks z<cr>zz

nnoremap <leader>x :execute <SID>ToggleQuickfix()<CR>
vnoremap <leader>A :!column -t<cr>

