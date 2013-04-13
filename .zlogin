{
  dump_file="$ZDOTDIR/.zcompdump"

  if [[ "$dump_file" -nt "${dump_file}.zwc" || ! -s "${dump_file}.zwc" ]]; then
    zcompile "$dump_file"
  fi
} &!
