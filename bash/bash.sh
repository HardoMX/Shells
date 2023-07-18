#!/bin/bash

stty -ixon #Disable ctrls-S and ctrl-Q
shopt -s autocd #Allows you to cd into directory by just typing directory name
HISTSIZE= HISTFILESIZE= #Set History File to Infinite

alias mkd="mkdir -pv"

if [ lsd ];
then
    alias ll="lsd -hal --group-directories-first"
    alias ls="lsd -ha --group-directories-first"
else
    alias ll="ls -hNal --color=auto --group-directories-first" #See all files and folders in a list with full info
    alias ls="ls -hN --color=auto --group-directories-first" #Nicer ls command
fi
alias grep="grep --color-auto"


eval "$(oh-my-posh init bash --config $HOME/Shells/oh-my-posh/theme.omp.json)"
