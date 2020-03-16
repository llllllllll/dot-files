export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx &

xsetroot -cursor_name left_ptr
xmodmap ~/.xmodmap
exec xmonad
