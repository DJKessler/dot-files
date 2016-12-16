#!/bin/bash
if [ -s $BASH ]; then
    file_name=${BASH_SOURCE[0]}
elif [ -s $ZSH_NAME ]; then
    file_name=${(%):-%x}
fi
script_dir=$(cd $(dirname $file_name) && pwd)

. $script_dir/base16-shell/realpath/realpath.sh

if [ -f ~/.base16_theme ]; then
  script_name=$(basename $(realpath ~/.base16_theme) .sh)
  echo "export BASE16_THEME=${script_name}"
  echo ". ~/.base16_theme"
fi
cat <<'FUNC'
_base16()
{
  local script=$1
  local theme=$2
  local script_dir=$3
  local xres_dir=$script_dir/base16-xresources
  [ -f $script ] && . $script
  ln -fs $script ~/.base16_theme
  export BASE16_THEME=${theme}
  echo -e "if \0041exists('g:colors_name') || g:colors_name != 'base16-$theme'\n  colorscheme base16-$theme\nendif" > ~/.vimrc_background

  local xres_link="$script_dir/base16.Xresources"
  local xres_src="$xres_dir/xresources/base16-$BASE16_THEME.Xresources"
  [ -L "$xres_link" ] && unlink "$xres_link"
 
  ln -s "$xres_src" "$xres_link"

  xrdb -merge ~/.Xresources
}
FUNC
for script in $script_dir/base16-shell/scripts/base16*.sh; do
  script_name=${script##*/}
  script_name=${script_name%.sh}
  theme=${script_name#*-}
  func_name="base16_${theme}"
  echo "alias $func_name=\"_base16 \\\"$script\\\" $theme $script_dir\""
done;
