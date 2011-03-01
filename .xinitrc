xmodmap -e "keycode 134 = Multi_key"
xmodmap -e "add control = Caps_Lock"
xmodmap .xmodmaprc
exec /usr/bin/xmonad

