#!/bin/bash

stty -ixon #Disable ctrls-S and ctrl-Q
HISTSIZE= HISTFILESIZE= #Set History File to Infinite

alias mkd="mkdir -pv"
alias cd..="cd .."
alias cd...="cd ../.."

if hash lsd 2>/dev/null;
then
    alias ll="lsd -hal --group-directories-first"
    alias ls="lsd -ha --group-directories-first"
else
    alias ll="ls -hNal --color=auto --group-directories-first" #See all files and folders in a list with full info
    alias ls="ls -hN --color=auto --group-directories-first" #Nicer ls command
fi
alias grep="grep --color=auto"

SUDO_EDITOR=/usr/bin/nvim
export SUDO_EDITOR
GIT_EDITOR=/usr/bin/nvim
export GIT_EDITOR

if hash oh-my-posh 2>/dev/null;
then
    # Choose between local and web-based config location. Local is faster, but web-based might be more up to date depending on your config
    # # eval "$(oh-my-posh init bash --config https://raw.githubusercontent.com/HardoMX/Shells/main/oh-my-posh/theme.omp.json)"
    eval "$(oh-my-posh init bash --config $HOME/Shells/oh-my-posh/theme.omp.json)"
fi

if hash git 2>/dev/null;
then
    alias gstat="git status"
    alias gadd="git add"
    alias gcom="git commit -m"
    alias gpush="git push"
    alias gpull="git pull"
    alias gco="git checkout"
    alias gdiff="git diff"
fi

if hash fastfetch 2>/dev/null;
then
    alias neofetch="fastfetch"
fi

if hash gem 2>/dev/null;
then
    export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
    export PATH="$PATH:$GEM_HOME/bin"
fi

if hash bob 2>/dev/null;
then
    export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"
fi
