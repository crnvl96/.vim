vim9script

# ----------------------------------------------------------------------
# Grep function

if executable('rg')
    set grepprg=rg\ -with-filename\ --hidden\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

command -nargs=1 -bar Grep {
    var cmd = $"{&grepprg} {expandcmd(<q-args>)}"
    cgetexpr system(cmd)
    setqflist([], 'a', {title: cmd})
}

command! -nargs=1 Rg Sh! rg --line-number --smart-case --column "<args>" .

nnoremap <leader>g :Rg<space>
nnoremap <leader>G :Grep<space>
