#/bin/bash
if command -v warp-cli &> /dev/null
then
    warp-cli delete
    warp-cli register
fi
function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#EXPORTS
export COMMANDLINE_ARGS='--skip-torch-cuda-test'
export DESKTOP_SESSION=bspwm
export _JAVA_AWT_WM_NONREPARENTING=1
export BROWSER=google-chrome-beta

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal

$HOME/.config/polybar/launch.sh &

#change your keyboard if you need it
#setxkbmap -layout be

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

if [ $keybLayout = "be" ]; then
  run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc-azerty &
else
  run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &
fi

#Some ways to set your wallpaper besides variety or nitrogen
#feh --bg-scale ~/.config/bspwm/wall.png &
#feh --bg-fill ./wallpaper/blue-theme-wallpaper_012345467.jpg &
feh --bg-fill ./wallpaper/blue-theme-wallpaper_012345467.jpg &
#feh --bg-fill /usr/share/backgrounds/archlinux/arch-wallpaper.jpg &
#feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &
#wallpaper for other Arch based systems
#feh --bg-fill /usr/share/archlinux-tweak-tool/data/wallpaper/wallpaper.png &
feh --randomize --bg-fill ~/Dropbox/Apps/Desktoppr/*

dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
xsetroot -cursor_name left_ptr &

#conky -c $HOME/.config/bspwm/system-overview &
run variety &
run nm-applet &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
#picom --config $HOME/.config/bspwm/picom/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
run volumeicon &
#nitrogen --restore &
#run caffeine &
#run vivaldi-stable &
#run firefox &
#run thunar &
#run dropbox &
#run insync start &
#run discord &
#run spotify &
#run atom &
#picom --experimental-backends &
picom &
greenclip daemon &
#conky-toggle &
bash $HOME/.config/bspwm/scripts/automaticGitPull.sh &
notify-send "Nhắc nhở" "Hãy điều chỉnh lại max frequency của cpu để tránh bị overheating"
notify-send "Frequency hiện tại" "Frequency của cpu hiện tại là: \nMin: $(cpupower frequency-info | awk '/current policy/ {printf($7 $8)}')\nMax: $(cpupower frequency-info | awk '/current policy/ {printf($10 $11)}')"
#cpupower-gui &
xscreensaver --no-splash &
ibus-daemon -rxR
