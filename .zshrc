# vim: fdm=marker
# options {{{
setopt auto_cd #automatically cd into new directory
setopt auto_pushd #on cd, push old dir to dir stack
setopt pushd_silent #silences pushd

setopt auto_list #autolist ambiguous completions

setopt extended_glob #extended globbing (#, ~, ^)
setopt glob_dots #glob dotfiles by default

setopt append_history #append instead of replacing history file
setopt bang_hist #historical expansion with !
setopt extended_history #give timestamp and duration in history file
setopt hist_ignore_all_dups #if duplicate cmd is found in hist, remove then log
setopt hist_ignore_space #if first cmd char is a space, do not log in history
setopt share_history #read/write to history file when necessary

setopt correct #[nyae]
setopt dvorak #dvorak spelling suggestions
setopt print_exit_value #if exit != 0, print it

setopt nonotify #print job status before prompt

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
REPORTTIME=30
# }}}

# zle {{{
bindkey -v
autoload -Uz compinit; compinit

# open in editor {{{
autoload -Uz edit-command-line; zle -N edit-command-line
bindkey -M vicmd '^v' edit-command-line
bindkey -M viins '^v' edit-command-line
# }}}

bindkey -M viins '^p' up-history
bindkey -M viins '^n' down-history

# quote/bracket text object {{{
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done
# }}}

# surround {{{
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround
# }}}

# }}}

# prompt {{{
PS1="%m:%2~%# "
RPS1="%D{%Y-%m-%d %H:%M:%S}"
# }}}

# aliases {{{
alias d="date -Iseconds"
alias emacs="emacs -nw"
alias ls="exa -l"
alias vi="nvim"
alias pd="popd"
alias nasu="~/rxv/uxn/uxnemu -s 3 ~/rxv/uxn/nasu.rom"
alias left="~/rxv/uxn/uxnemu -s 2 ~/rxv/uxn/left.rom"
alias noodle="~/rxv/uxn/uxnemu -s 2 ~/rxv/uxn/noodle.rom"
alias startx="startx ~/.xinitrc"
alias t="todo.sh"

alias tl="tmux ls"
alias ta="tmux new -As"

alias gs="git status"
alias gc="git commit"
alias gd="git diff"

alias ys="yadm status"
alias yc="yadm commit"
alias yd="yadm diff"

# i do not know how i missed out on zsh suffix aliases for so long
alias -s git="git clone"
alias -s {png,jpg,gif}="feh"
alias -s pdf="zathura"
alias -s c="nvim"
# }}}

# plugins {{{
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
# }}}

today
