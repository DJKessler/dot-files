#!/usr/bin/env bash

ts() { printf '%s\t%s\t\n' "$(date)" "$*"; }

envlog() {
  if [ -z ${ENV_LOG+x} ]; then
    logger -t "$USER"-env "$@";
  else
    ts >> "$ENV_LOG" "$@"
  fi
}

export -f envlog
