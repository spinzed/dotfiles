# .xinitrc

# Required for NVIDIA GPU-powered display
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

# Screensaver settings
xset s off         # don't activate screensaver
xset -dpms         # disable DPMS (Energy Star) features.
xset s noblank     # don't blank the video device

# Change the keyboard speed
xset r rate 250 50

# Keyboard bind settings
setxkbmap -option caps:escape_shifted_capslock # bind Caps Lock to ESC and shift + Caps Lock to Caps Lock
# setxkbmap -option # revert the caps lock bind
setxkbmap -option grp:win_space_toggle -layout us,hr,rs,ru

# In cases where the pointer should b a black cross, this
# changes it to be normal (per example when hovering over background)
xsetroot -cursor_name left_ptr

# Enable xbindkeys which changes the behavior of mouse middle click
xbindkeys

export MONITOR="integrated"

# If the external monitor is connected, turn off the integrated display
# and enable 144 Hz on the external one.
if [ $(xrandr --listmonitors | grep HDMI | wc -l) -gt 0 ]; then
    xrandr --output HDMI-0 --mode 1920x1080 --rate 144.00
    xrandr --output eDP-1-1 --off
    export MONITOR="external"
fi

# xrandr --output eDP-1-1 --brightness 1.2 # raise max laptop brightness
# xrandr --auto --output eDP-1-1 --mode 1920x1080 --left-of HDMI-0 # set the laptop screen left of the monitor
# xrandr --output HDMI-1 --auto --above LVDS1L

# exec startplasma-x11 # Start KDE Plasma
# exec i3 # Start i3

exec bspwm # Start bspwm

