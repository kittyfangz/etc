HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
unsetopt beep
bindkey -v
zstyle :compinstall filename '/home/fangz/.zshrc'

autoload -Uz compinit
compinit

# yes. i use both.
alias d="date -Iseconds"
alias emacs="emacs -nw"
alias ls="exa -l"
alias vi="nvim"
alias nasu="$HOME/rxv/uxn/uxnemu -s 3 $HOME/rxv/uxn/nasu.rom"
alias left="$HOME/rxv/uxn/uxnemu -s 2 $HOME/rxv/uxn/left.rom"

alias t="tmux"
alias tl="tmux ls"
alias ta="tmux new -As"

PS1="%m:%2~%# "
RPS1="%D{%Y-%m-%d %H:%M:%S}"

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

today
