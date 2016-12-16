# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f /etc/bash_completion.d/git-prompt ]; then
  source /etc/bash_completion.d/git-prompt
fi

base16_shell_dir="$shell_cfg_dir/base16-shell"
base16_xres_dir="$shell_cfg_dir/base16-xresources"

## setup base16 colorscheme
if [ -d "$base16_shell_dir" ]; then
  if [ "$PS1" ] && [ -s "$shell_cfg_dir/profile_helper.sh" ]; then
    eval "$($shell_cfg_dir/profile_helper.sh)"
  fi
fi

## setup base16 xresources
if [ -d "$base16_xres_dir" ]; then
  [ ! -f ~/.base16_theme ] && base16_brewer
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ -d /usr/lib/ccache ]; then
  export PATH="/usr/lib/ccache:$PATH"
fi
