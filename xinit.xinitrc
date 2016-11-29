#!/usr/bin/env bash

export ENV_LOG="$HOME/env.log";

source "$HOME/.unixrc/shell-configs/logger.bash";

if [ ! -e "/usr/bin/i3" ]; then
  envlog "i3wm is not installed!";
elif [ -e "$HOME/.xinitrc-local" ]; then
  envlog "Sourcing $HOME/.xinitrc-local";
  source "$HOME/.xinitrc-local";
fi
