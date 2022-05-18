#!/bin/bash
#it's probably not a good idea to run this outside of a terminal because it will
#be annoying to stop the recording
slop=$(slop -f "%x %y %w %h %g %i") || exit 1
ctime=$(date '+%s')
read -r X Y W H G ID < <(echo $slop)
ffmpeg \
	-f alsa \
	-ac 2 \
	-i pulse \
	-f x11grab \
	-framerate 30 \
	-s "$W"x"$H" \
	-i :0.0+$X,$Y \
	-acodec pcm_s16le \
	-vcodec libx264 \
	-preset ultrafast \
	-crf 0 \
	-threads 0 \
	-vf setpts=N/FR/TB \
	~/vid/rec/"$ctime".mkv

	# -copyts \
