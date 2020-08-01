#
# ~/.bash_profile
#

# Enviromental variables
export PATH="$PATH:$HOME/Scripts"
export EDITOR="/bin/nvim"
export VISUAL="/bin/nvim"
export TERMINAL="konsole"
export BROWSER="firefox"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export NODE_PATH="/usr/local/bin"

# Call .bashrc on login shell
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start Xorg if not started already
if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x Xorg || exec startx
fi

