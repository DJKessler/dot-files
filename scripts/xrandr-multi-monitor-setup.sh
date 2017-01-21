#!/usr/bin/env bash

min_params=3

if [ $# -lt "$min_params" ]
then
  echo "Usage: $0 <internal_display> <left external display> <right external display>"
  exit -1
fi

internal="$1"
left="$2"
right="$3"

xrandr --dpi 109 --output $internal --off \
       --output $right --mode 2560x1440 --pos    0x0 --primary \
       --output $left --mode 2560x1440 --left-of $right

