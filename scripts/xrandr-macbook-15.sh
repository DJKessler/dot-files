#!/usr/bin/env bash

min_params=3

if [ $# -lt "$min_params" ]
then
  echo "Usage: $0 <internal_display> <left external display> <right external display>"
fi

internal="$1"
left="$2"
right="$3"

xrandr --dpi 192 --output $internal --mode 2880x1800 --primary \
       --output $right --off \
       --output $left --off

