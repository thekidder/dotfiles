# ~/.bashrc: executed by bash(1) for non-login shells.

for f in ~/.bashrc.d/*; do source $f; done

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

unalias -a

#completion with sudo
complete -cf sudo

shopt -s histappend         # append to the history file, don't overwrite it
shopt -s cdable_vars        # if cd arg is not valid, assumes its a var defining a dir
shopt -s cdspell            # autocorrects cd misspellings
shopt -s checkwinsize       # update the value of LINES and COLUMNS after each command if altered
shopt -s cmdhist            # save multi-line commands in history as single line
shopt -s dotglob            # include dotfiles in pathname expansion
shopt -s expand_aliases     # expand aliases
shopt -s extglob            # enable extended pattern-matching features
shopt -s hostcomplete       # attempt hostname expansion when @ is at the beginning of a word
shopt -s nocaseglob         # pathname expansion will be treated as case-insensitive

export CLICOLOR=1
export EDITOR="emacs -nw"
export HISTCONTROL=ignoreboth # don't put duplicate lines/leading whitespace lines in the history
export HISTSIZE=1000
export LESS="-RIM"
export GIT_SSH="$HOME/myrepos/ssh-ident/ssh-ident"

NPM_PACKAGES="$HOME/.npm-packages"
export PATH="$HOME/bin:$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
# required for rootless npm
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"


source "$HOME/.homesick/repos/homeshick/homeshick.sh"

#-------------------------------------------------------------
# Source other files
#-------------------------------------------------------------
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#-------------------------------------------------------------
# Python definitions
#-------------------------------------------------------------
export PYENV_ROOT="${HOME}/.pyenv"

if [ -d "${PYENV_ROOT}" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    eval "$(pyenv init -)"
fi
export PATH

export WORKON_HOME=~/.virtualenvs
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
  source /usr/local/bin/virtualenvwrapper_lazy.sh
elif [ -f /usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh ]; then
  export VIRTUALENVWRAPPER_SCRIPT=/usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh
  source /usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh
fi

#-------------------------------------------------------------
# Node definitions
#-------------------------------------------------------------
export NVM_DIR="/Users/kidder/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#-------------------------------------------------------------
# prompt: https://github.com/nojhan/liquidprompt
#-------------------------------------------------------------
# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source $HOME/myrepos/liquidprompt/liquidprompt

export NVM_DIR="$HOME/.nvm"

if [ -d /usr/local/opt/nvm ]; then
  . "/usr/local/opt/nvm/nvm.sh"
fi

# for publishing the commute project
export COMMUTE_SSH_SERVER=kidder@thekidder.com
export COMMUTE_SSH_OPTIONS="-i ~/.ssh/identities/personal/id_rsa"
export COMMUTE_PATH=/var/www/thekidder/commute

export PATH="/home/kidder/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
