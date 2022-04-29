# vim: fdm=marker
# zsh setup bullshit {{{
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
unsetopt beep
bindkey -v
zstyle :compinstall filename '/home/fangz/.zshrc'

autoload -Uz compinit
compinit
# }}}

# aliases {{{
alias d="date -Iseconds"
alias emacs="emacs -nw"
alias ls="exa -l"
alias vi="nvim"
alias nasu="~/rxv/uxn/uxnemu -s 3 ~/rxv/uxn/nasu.rom"
alias left="~/rxv/uxn/uxnemu -s 2 ~/rxv/uxn/left.rom"
alias noodle="~/rxv/uxn/uxnemu -s 2 ~/rxv/uxn/noodle.rom"
alias startx="startx ~/.xinitrc"

alias t="tmux"
alias tl="tmux ls"
alias ta="tmux new -As"

alias gs="git status"
alias gc="git commit"
alias gd="git diff"

alias ys="yadm status"
alias yc="yadm commit"
alias yd="yadm diff"
# }}}

# prompt {{{
PS1="%m:%2~%# "
RPS1="%D{%Y-%m-%d %H:%M:%S}"
# }}}

# plugins {{{
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
# }}}

today
