if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
else
  # fix the incorrect source order on Arch
  emulate sh -c 'source /etc/profile'
  export BROWSER='chromium'
fi

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

  /usr/local/{bin,sbin}
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

# if we have brew, add gnu coreutils to path
if [[ "$OSTYPE" == darwin* ]] && (( $+commands[brew] )); then
  path=( "$(brew --prefix coreutils)/libexec/gnubin" $path )
fi

if (( $+commands[dmenu] )); then
  # dmenu-xft required
  export DMENU_OPTIONS='-i -fn Verdana-16 -nb #303030 -nf #909090 -sb #909090 -sf #303030'
fi

for f in '.screen/screen.sh' '.secrets'; do
  [[ -r "$HOME/$f" ]] && source "$HOME/$f"
done
unset -v f

# start x if appropriate
[[ $TTY == /dev/tty1 ]] \
  && (( $UID ))         \
  && [[ -z $DISPLAY ]]  \
  && exec systemd --user
