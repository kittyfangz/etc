#!/bin/sh
# dear fuck

# using current desktop only to minimise number of windows to check
nodes=$(bspc query -N -d)

for id in $nodes
do
	name=$(xprop -id "$id" 2> /dev/null | awk '/WM_CLASS/ {print $4}')

	if [ "$name" = "\"mpv\"" ]
	then
		bspc node "$id" -g hidden
		break
	fi
done
