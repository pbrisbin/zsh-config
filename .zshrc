SSHPID=$(ps ax | grep -c "[s]sh-agent")

if (( $SSHPID == 0 )); then
  ssh-agent > ~/.ssh-env
  source ~/.ssh-env
  ssh-add
else
  source ~/.ssh-env
fi

HISTSIZE=12000
SAVEHIST=50000

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

alias git=hub; compdef hub=git

bindkey '^[[Z' reverse-menu-complete       # Shift-Tab
bindkey -M viins '^?' backward-delete-char # Backspace

export BROWSER='chromium'

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt vi

function ruby_version_prompt() {
  REPLY=$(ruby --version | cut -d ' ' -f 1-2)
}

grml_theme_add_token ruby-version -f ruby_version_prompt '%B%F{black}' '%b%f'

zstyle ':prompt:grml:right:setup' items ruby-version
