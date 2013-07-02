typeset -gU cdpath path

cdpath=( "$HOME/Code" $cdpath )

path=( "$HOME/.bin" "$HOME/.cabal/bin" $path )

if [[ -e /usr/share/chruby ]]; then
  source /usr/share/chruby/chruby.sh
  source /usr/share/chruby/auto.sh

  chruby $(cat ~/.ruby-version)
fi

# password-containing environment variables
[[ -r "$HOME/.secrets" ]] && source "$HOME/.secrets"

# start x if appropriate
[[ $TTY == /dev/tty1 ]] && [[ -z $DISPLAY ]] && exec startx
