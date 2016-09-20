#!/usr/bin/env bash

mb_disp="eDP"
lt_disp="DisplayPort-1"
rt_disp="DisplayPort-0"

xrandr --dpi 192 --output $mb_disp --mode 2880x1800 --primary \
       --output $rt_disp --off \
       --output $lt_disp --off

