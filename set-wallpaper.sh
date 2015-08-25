#!/usr/bin/env bash

# a script that randomly selects a JPG file from a directory and sets it as the
# desktop background

# requires:
#  feh

# directory to select wallpaper from
WALLPAPER_DIR="$HOME/Google Drive/wallpapers"

if [ ! -d "$WALLPAPER_DIR/" ]; then
  echo "no wallpaper directory"
  return 1;
fi

# randomly select an image from the directory
WALLPAPER=$(\ls "$WALLPAPER_DIR"/*{.jpg,.png} | shuf -n1)

# set the selected image as the desktop wallpaper
#/usr/bin/feh --bg-scale "$WALLPAPER"
/usr/bin/feh --bg-center "$WALLPAPER"

