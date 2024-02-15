#
# .bash_profile
#

# Enviromental variables
export PATH="$PATH:$HOME/.local/bin:$HOME/Scripts"
export EDITOR="/bin/nvim"
export VISUAL="/bin/nvim"
export TERMINAL="gnome-terminal"
export BROWSER="firefox"
export CHROME_EXECUTABLE="google-chrome-stable"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export NODE_PATH="/usr/local/bin"
export JAVA_HOME="/usr/lib/jvm/default-runtime"
export HISTCONTROL=ignoreboth
export SCREENSHOTDIR="$HOME/Pictures/Screenshots"

type &>/etc/profile.d/cuda.dsh && /etc/profile.d/cuda.sh # fucking cuda

# VSCodium environment variables
export VSCODE_GALLERY_SERVICE_URL='https://marketplace.visualstudio.com/_apis/public/gallery'
export VSCODE_GALLERY_CACHE_URL='https://vscode.blob.core.windows.net/gallery/index'
export VSCODE_GALLERY_ITEM_URL='https://marketplace.visualstudio.com/items'
export VSCODE_GALLERY_CONTROL_URL=''
export VSCODE_GALLERY_RECOMMENDATIONS_URL=''

# Firefox environment variables. Should be the default since ff96 though
export MOZ_WEBRENDER=1
export MOZ_ENABLE_WAYLAND=1

# Wayland & nvidia related
export XDG_SESSION_TYPE=wayland
export LIBVA_DRIVER_NAME=nvidia
export MOZ_DISABLE_RDD_SANDBOX=1
#export EGL_PLATFORM=wayland
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export _JAVA_AWT_WM_NONREPARENTING=1
export NVD_BACKEND=direct

# Start Xorg if not started already
if [ "$(tty)" = "/dev/tty1" ]; then
	#pgrep -x Xorg || exec startx
	echo placeholder
fi

# Call .bashrc on login shell
[[ -f ~/.bashrc ]] && . ~/.bashrc

