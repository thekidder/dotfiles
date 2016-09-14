alias la='ls -lah $LS_COLOR'
# cl is cd/ls combined
function cl(){ cd "$@" && la; }

alias ssh="$HOME/myrepos/ssh-ident/ssh-ident"
alias scp="BINARY_SSH=scp $HOME/myrepos/ssh-ident/ssh-ident"
