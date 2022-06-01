pgrep -x mpd > /dev/null || mpd &
[ -S /tmp/mpvsocket ] || mpv --input-ipc-server=/tmp/mpvsocket > /dev/null
