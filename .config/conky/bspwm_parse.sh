#!/bin/sh
#this will definitely not work for multi-monitor setups
wm= #buffer we will add text to
status=$(bspc wm -g | cut -d':' -f2- | tr ':' '\n')
# IFS=':'
while read -r line
do
	name=${line#?}
	case $line in
		[OUu]*) #occupied focused, or urgent
			wm="${wm}%{R}%{A:bspc desktop -f ${name}:} ${name} %{A}%{R}"
			;;
		o*) #occupied unfocused
			wm="${wm}%{A:bspc desktop -f ${name}:} ${name} %{A}"
			;;
		F*) #free focused
			wm="${wm}%{R}%{A:bspc desktop -f ${name}:} 0 %{A}%{R}"
			;;
		f*) #free unfocused
			wm="${wm}%{A:bspc desktop -f ${name}:} 0 %{A}"
			;;
	esac
done << EOF
$status
EOF

echo "$wm"
