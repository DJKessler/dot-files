#!/usr/bin/env sh

if test ! -e "/usr/bin/i3"; then
  return 1;
fi

if test -e "$HOME/.xinitrc-local"; then
  source "$HOME/.xinitrc-local";
  return 0;
fi
