source "$ZDOTDIR/functions/setup_completion"
source "$ZDOTDIR/functions/setup_terminal_title"
source "$ZDOTDIR/functions/setup_ssh_agent"

export BROWSER='chromium'
export PAGER='less'

export GREP_COLOR='1;32'
export GREP_OPTIONS='--color=auto'

export LESS='-R -w'
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[38;5;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'

HISTFILE="$HOME/.zhistory"
HISTSIZE=12000
SAVEHIST=50000
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

[[ -r $HOME/.dir_colors ]] && eval "$(dircolors -b $HOME/.dir_colors)"

alias ls='ls --color=auto'
alias v='vim'
alias g='git'
alias p='sudo pacman'
alias b='bundle'
alias be='b exec'
alias irc='screen -R -D -S irc'
alias rtor='screen -R -D -S rtor'
alias piso='mplayer dvd://1 -dvd-device'
alias pdvd='mplayer dvdnav:// -dvd-device /dev/sr0 -mouse-movements'
alias hdocs="$BROWSER $HOME/.cabal/share/doc/index.html"
alias db-reset='be rake db:drop db:create db:migrate db:seed db:test:prepare'

(( $+commands[hub] )) && eval "$(hub alias -s)"

bindkey '^[[Z' reverse-menu-complete       # Shift-Tab
bindkey '^[[3~' delete-char                # Delete
bindkey -M viins '^?' backward-delete-char # Backspace
bindkey '^R' history-incremental-search-backward

setopt auto_cd

autoload -Uz promptinit && promptinit
prompt minimal
