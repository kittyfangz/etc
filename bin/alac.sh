#!/bin/sh
alacritty --class editor -o window.dimensions.columns=80 -o \
	window.dimensions.lines=24 -o window.position.x=50 -o \
	window.position.y=50 -e $@
