alias la='ls -lah $LS_COLOR'
# cl is cd/ls combined
function cl(){ cd "$@" && la; }
