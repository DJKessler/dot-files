#!/usr/bin/env bash

mb_disp="eDP"
lt_disp="DisplayPort-1"
rt_disp="DisplayPort-0"

#
# dual external setup
#
xrandr --dpi 109 --output $mb_disp --off \
       --output $rt_disp --mode 2560x1440 --pos    0x0 --primary \
       --output $lt_disp --mode 2560x1440 --left-of $rt_disp

