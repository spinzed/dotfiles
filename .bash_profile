#
# .bash_profile
#

# Enviromental variables
export PATH="$PATH:$HOME/.local/bin:$HOME/Scripts"
export EDITOR="/bin/nvim"
export VISUAL="/bin/nvim"
export TERMINAL="konsole"
export BROWSER="firefox"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export NODE_PATH="/usr/local/bin"
export JAVA_HOME="/usr/lib/jvm/default-runtime"
export HISTCONTROL=ignoreboth
export SCREENSHOTDIR="$HOME/Pictures/Screenshots"

# VSCodium environmental variables
export VSCODE_GALLERY_SERVICE_URL='https://marketplace.visualstudio.com/_apis/public/gallery'
export VSCODE_GALLERY_CACHE_URL='https://vscode.blob.core.windows.net/gallery/index'
export VSCODE_GALLERY_ITEM_URL='https://marketplace.visualstudio.com/items'
export VSCODE_GALLERY_CONTROL_URL=''
export VSCODE_GALLERY_RECOMMENDATIONS_URL=''

# Firefox environmental variables. Should be the default since ff96 though
export MOZ_WEBRENDER=1

# Start Xorg if not started already
if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x Xorg || exec startx
fi

# Call .bashrc on login shell
[[ -f ~/.bashrc ]] && . ~/.bashrc

