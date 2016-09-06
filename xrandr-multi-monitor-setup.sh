#!/usr/bin/env bash

#
# dual external setup
#
xrandr --dpi 109 --output LVDS --off \
       --output DFP1 --mode 2560x1440 --pos    0x0 --primary \
       --output DFP5 --mode 2560x1440 --left-of DFP1

