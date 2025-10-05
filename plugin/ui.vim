vim9script

set fillchars=foldopen:,foldclose:,fold:\ ,foldsep:\ ,diff:╱,eob:~
set listchars=extends:…,nbsp:␣,precedes:…,tab:\ \ ,trail:·

set background=dark

# seoul256 (dark):
#   Range:   233 (darkest) ~ 239 (lightest)
#   Default: 237


# seoul256 (light):
#   Range:   252 (darkest) ~ 256 (lightest)
#   Default: 253

g:seoul256_background = 234
colo seoul256
