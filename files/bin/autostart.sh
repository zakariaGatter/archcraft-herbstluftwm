#!/usr/bin/env bash

## Copyright (C) 2020-2023 Aditya Shakya <adi1090x@gmail.com>
## Autostart Programs

# Kill already running process
_ps=(picom dunst ksuperkey mpd xfce-polkit xfce4-power-manager)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done

# Fix cursor
xsetroot -cursor_name left_ptr

# Polkit agent
/usr/lib/xfce-polkit/xfce-polkit &

# Enable power management
xfce4-power-manager &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# Set/Restore wallpaper
hsetroot -solid "#BDBAB5"

# Lauch notification daemon
~/.config/herbstluftwm/bin/herbdunst.sh

# Lauch polybar
~/.config/herbstluftwm/bin/herbbar.sh

# Lauch compositor
~/.config/herbstluftwm/bin/herbcomp.sh

# Start mpd
exec mpd &
