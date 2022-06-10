# setup_tmux() {
# 	tmux new-session -d -s "tools" -n "ncmpcpp" "ncmpcpp"
# 	tmux new-window -d -n "newsboat" "newsboat"
# }

pgrep -x mpd > /dev/null || mpd &
# pgrep tmux > /dev/null || setup_tmux &
