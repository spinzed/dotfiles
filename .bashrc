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

# These were moved from .xinitrc so that they work with x sessions that
# haven't been started with startx
if [ -z "$DISPLAY" ]; then
    xset r rate 250 50
    setxkbmap -option caps:escape_shifted_capslock
fi

# Aliases
alias ls="ls --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias la="ls -lahv"
alias s="sudo"
alias fuck='sudo $(history -p !!)'
alias reset="tput reset"
alias p="sudo pacman"
alias repos="cd ~/Workspaces/repos"
alias faks="cd ~/Workspaces/faks"
alias nv="nvim"
alias snv="sudo nvim"
alias cls="clear"
alias ref="source ~/.bash_profile"
alias vimrc="cd ~/.config/nvim; nvim ~/.config/nvim/init.lua; cd -"
alias bashrc="nvim ~/.bashrc"
alias notes="nvim Notes"
alias xorg="s -e /etc/X11/xorg.conf" # Believe me, this was necessary...
alias dotconf='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias server="ssh ubuntu@dnajev.net"
alias :q="exit"
alias :qa=":q"
alias chmar="chmod"
alias open="xdg-open"

cloc() {
     find . -name "*.$1" -print | xargs wc -l | sort -n
}

#dotconf config --local status.showUntrackedFiles no # disable viewing of untracked files

