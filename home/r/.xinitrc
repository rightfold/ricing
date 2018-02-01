# Needs to run as root. I have no clue why.
sudo VBoxClient-all

# This is used to set the urxvt colors.
xrdb -merge ~/.Xresources

# This is used to set the wallpaper.
sh ~/.fehbg

# Use shift for numbers, instead of for symbols.
xmodmap -e 'keycode 10 = exclam 1 1 exclam'
xmodmap -e 'keycode 11 = at 2 2 at'
xmodmap -e 'keycode 12 = numbersign 3 3 numbersign'
xmodmap -e 'keycode 13 = dollar 4 4 dollar'
xmodmap -e 'keycode 14 = percent 5 5 percent'
xmodmap -e 'keycode 15 = asciicircum 6 6 asciicircum dead_circumflex dead_circumflex dead_circumflex'
xmodmap -e 'keycode 16 = ampersand 7 7 ampersand'
xmodmap -e 'keycode 17 = asterisk 8 8 asterisk'
xmodmap -e 'keycode 18 = parenleft 9 9 parenleft dead_grave NoSymbol dead_grave'
xmodmap -e 'keycode 19 = parenright 0 0 parenright'

# Start the window manager.
exec i3
