if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH="/usr/local/bin:$PATH"
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

  # remove duplicate entries from $PATH
  typeset -aU path
fi
