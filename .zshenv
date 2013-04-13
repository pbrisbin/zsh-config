export BROWSER='chromium'
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export LESS='-R -w'

typeset -gU fpath cdpath manpath path

fpath=(
  "$ZDOTDIR/functions"
  $fpath
)

manpath=(
  /usr/local/share/man
  $manpath
)

path=(
  "$HOME/.bin"
  "$HOME/.cabal/bin"
  "$HOME/Code/bin"
  $path
)

cdpath=(
  "$HOME/Code"
  $cdpath
)

if [[ -e /usr/share/chruby ]]; then
  source /usr/share/chruby/chruby.sh
  source /usr/share/chruby/auto.sh
  chruby $(cat ~/.ruby-version)
fi

if (( $+commands[dmenu] )); then
  # dmenu-xft required
  export DMENU_OPTIONS='-i -fn Verdana-12 -nb #303030 -nf #909090 -sb #909090 -sf #303030'
fi

# password-containing environment variables
[[ -r "$HOME/.secrets" ]] && source "$HOME/.secrets"

# start x if appropriate
[[ $TTY == /dev/tty1 ]] \
  && (( $UID ))         \
  && [[ -z $DISPLAY ]]  \
  && exec systemd --user
