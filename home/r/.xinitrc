# Needs to run as root. I have no clue why.
sudo VBoxClient-all

# This is used to set the urxvt colors.
xrdb -merge ~/.Xresources

# This is used to set the wallpaper.
sh ~/.fehbg

# Start the window manager.
exec i3
