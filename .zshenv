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

# password-containing environment variables
[[ -r "$HOME/.secrets" ]] && source "$HOME/.secrets"

# start x if appropriate
[[ $TTY == /dev/tty1 ]] \
  && (( $UID ))         \
  && [[ -z $DISPLAY ]]  \
  && exec systemd --user
