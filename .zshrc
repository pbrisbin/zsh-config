eval "$(dircolors -b $HOME/.dir_colors)"

export GREP_COLOR='1;32'
export GREP_OPTIONS='--color=auto'
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;5;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'

alias ls='ls --color=auto'
alias v='vim'
alias g='git'
alias p='sudo pacman'
alias b='bundle'
alias be='b exec'
alias piso='mplayer dvd://1 -dvd-device'
alias pdvd='mplayer dvdnav:// -dvd-device /dev/sr0 -mouse-movements'
alias hdocs="$BROWSER $HOME/.cabal/share/doc/index.html"

bindkey '^[[Z' reverse-menu-complete       # Shift-Tab
bindkey '^[[3~' delete-char                # Delete
bindkey -M viins '^?' backward-delete-char # Backspace

source "$ZDOTDIR/functions/setup_completion"
source "$ZDOTDIR/functions/setup_terminal_title"
source "$ZDOTDIR/functions/setup_ssh_agent"

autoload -Uz promptinit && promptinit
prompt minimal
