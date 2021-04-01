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
stty -ixon # Disable Ctrl-s & Ctrl-q

shopt -s checkwinsize # Prevent terminal from messing up after commands. On by default

# Aliases
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias la="ls -lah"
alias s="sudo"
alias fuck='sudo $(history -p !!)'
alias p="sudo pacman"
alias repos="cd ~/Workspaces/repos"
alias nv="nvim"
alias snv="sudo nvim"
alias cls="clear"
alias ref="source ~/.bash_profile"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias bashrc="nvim ~/.bashrc"
alias notes="nvim ~/.notes"
alias xorg="s nvim /etc/X11/xorg.conf" # Believe me, this was necessary...
alias dotconf='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

#dotconf config --local status.showUntrackedFiles no # disable viewing of untracked files

