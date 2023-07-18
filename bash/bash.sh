#!/bin/bash

stty -ixon #Disable ctrls-S and ctrl-Q
shopt -s autocd #Allows you to cd into directory by just typing directory name
HISTSIZE= HISTFILESIZE= #Set History File to Infinite

alias mkd="mkdir -pv"

alias ll="ls -hNal --color=auto --group-directories-first"
alias ls="ls -hN --color=auto --group-directories-first"

eval "$(oh-my-posh init bash --config $HOME/Shells/oh-my-posh/theme.omp.json)"
