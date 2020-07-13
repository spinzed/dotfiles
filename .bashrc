#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Terminal look customisation
PS1="\[$(tput setaf 48)\]\u\[$(tput setaf 063)\]@\h \[$(tput setaf 056)\]\W \[$(tput sgr0)\]$ "

# General settings
set -o vi # Enable vi mode in terminal
shopt -s autocd # Allows to cd into a directory by typing its name

# Aliases
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias la="ls -lah"
alias s="sudo"
alias p="sudo pacman"
alias nv="nvim"
alias snv="sudo nvim"
alias cls="clear"
alias ref="source ~/.bash_profile"
alias dotconf='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

