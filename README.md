> [!NOTE]
> All of my GitHub repositories have been **archived** and will be migrated to
> Codeberg as I next work on them. This repository either now lives, or will
> live, at:
>
> https://codeberg.org/pbrisbin/zsh-config
>
> If you need to report an Issue or raise a PR, and this migration hasn't
> happened yet, send an email to me@pbrisbin.com.

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
