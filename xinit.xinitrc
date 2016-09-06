#!/usr/bin/env bash

if [ ! -e "/usr/bin/i3" ]; then
  logger "i3wm is not installed!";
elif [ -e "$HOME/.xinitrc-local" ]; then
  logger "Sourcing $HOME/.xinitrc-local";
  source "$HOME/.xinitrc-local";
fi
