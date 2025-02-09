#!/usr/bin/env bash

## Copyright (C) 2020-2023 Aditya Shakya <adi1090x@gmail.com>

## launch alacritty with herbstluftwm config

CONFIG="$HOME/.config/herbstluftwm/alacritty/alacritty.yml"

if [ "$1" == "--float" ]; then
	alacritty --class 'alacritty-float,alacritty-float' --config-file "$CONFIG"
elif [ "$1" == "--full" ]; then
	alacritty --class 'Fullscreen,Fullscreen' --config-file "$CONFIG" \
			  -o window.startup_mode=fullscreen window.padding.x=30 window.padding.y=30 \
			  window.opacity=0.95 font.size=14
else
	alacritty --config-file "$CONFIG"
fi
