*NOTE: My ZSH configuration has been moved in with my main [dotfiles][] 
repo. Any future updates will occur there.*

[dotfiles]: https://github.com/pbrisbin/dotfiles

---

# ZSH

## Usage

~~~
$ git clone https://github.com/pbrisbin/zsh-config ~/.zsh
$ cat > ~/.zshenv <<"EOF"
export ZDOTDIR="$HOME/.zsh"
source "$ZDOTDIR/.zshenv"
EOF
~~~

And open a new terminal.

I try to be good about portability and checking for things before 
setting stuff up, but there are likely to be some rough edges.
