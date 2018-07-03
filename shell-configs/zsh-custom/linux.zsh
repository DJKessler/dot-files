if [[ "$OSTYPE" == "linux-gnu"* ]]; then

  export EDITOR=`which vim`

  # remove duplicate entries from $PATH
  typeset -aU path
fi
