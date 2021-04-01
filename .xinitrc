# .xinitrc

xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --setprovideroutputsource NVIDIA-G0 modesetting
xrandr --auto
#xrandr --output HDMI-1 --auto --above LVDS1L
# exec startplasma-x11 # Start KDE Plasma'
# exec startlightdm
exec i3 # Start i3

