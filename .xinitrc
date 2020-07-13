# .xinitrc

exec startplasma-x11 # Start KDE Plasma

xset r rate 250 50 # Change the keyboard speed
setxkbmap -option caps:escape # Bind Caps Lock to ESC
stty -ixon # Disable Ctrl-s & Ctrl-q
