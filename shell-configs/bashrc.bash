# make our editor vim
export EDITOR=/usr/bin/vim

dot_dir="$HOME/.dot-files"
shell_cfg_dir="$dot_dir/shell-configs"

#  BASH COLOR ALIASES
if [ -f $shell_cfg_dir/colors.bash ]; then
  . $shell_cfg_dir/colors.bash
fi

if [[ "$OSTYPE" == "linux-gnu" ]] || [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH=$(getconf PATH)
fi

# determine if this is a mac or linux machine
if [[ "$OSTYPE" == "linux-gnu" ]]; then ######################### this is ubuntu
  export PATH="$PATH:/sbin:/usr/sbin:/usr/lib:/usr/local/bin:/usr/local/sbin"
  if [ -f "$shell_cfg_dir/bashrc-linux.bash" ]; then
    . "$shell_cfg_dir/bashrc-linux.bash"
  fi
  if [ -f "$shell_cfg_dir/aliases-linux.bash" ]; then
    . "$shell_cfg_dir/aliases-linux.bash"
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then ############################ this is osx
  export PATH="$PATH:/usr/local/bin:/opt/X11/bin:/usr/texbin:/usr/local/git/bin"
  if [ -f "$shell_cfg_dir/bashrc-osx.bash" ]; then
    . "$shell_cfg_dir/bashrc-osx.bash"
  fi
  if [ -f "$shell_cfg_dir/aliases-osx.bash" ]; then
    . "$shell_cfg_dir/aliases-osx.bash"
  fi
fi

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=100000
export HISTFILESIZE=1000000
export HISTCONTROL=ignorespace:ignoredups

# override the bash's default history() function
history() {
  _bash_history_sync
  builtin history "$@"
}

#  #1 Append the line just entered to $HISTFILE.
#     This causes $HISTFILE to grow by one line.
#  #2 Setting $HISTFILESIZE to some value causes Bash to truncate $HISTFILE to
#     be no longer than $HISTFILESIZE lines by removing the oldest entries.
#  #3 Clear the history of the running session. This will reduce the history
#     counter by the amount of $HISTSIZE.
#  #4 Read the contents of $HISTFILE and insert them in to the current running
#     session history. this will raise the history counter by the amount of 
#     lines in $HISTFILE. Note that the line count of $HISTFILE is not 
#     necessarily $HISTFILESIZE.
_bash_history_sync () {
  builtin history -a         #1
  HISTFILESIZE=$HISTSIZE     #2
  builtin history -c         #3
  builtin history -r         #4
}

PROMPT_COMMAND=_bash_history_sync
export PROMPT_DIRTRIM=2

# set the commands that should not be saved to history
export HISTIGNORE="[bf]g:exit"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

force_color_prompt=yes
color_prompt=yes

# Alias definitions.
if [ -f "$shell_cfg_dir/aliases.bash" ]; then
	source "$shell_cfg_dir/aliases.bash"
fi

# git repo status in ps1
if [ -f "$dot_dir/git-prompt.sh" ]; then
	source "$dot_dir/git-prompt.sh"
fi

# cross compile toolchain
if [ -d "$HOME/arm-toolchain/usr/bin" ]; then
  export PATH="$PATH:$HOME/arm-toolchain/usr/bin"
  alias cmake-arm="$HOME/arm-toolchain/usr/bin/cmake -DCMAKE_TOOLCHAIN_FILE=$HOME/arm-toolchain/usr/share/buildroot/toolchainfile.cmake"
fi

if [ -d "$HOME/bin" ]; then
  home_bin="$HOME/bin";
fi

# clion IDE path
if [ -d "$home_bin/clion/bin" ]; then
  export PATH="$PATH:$home_bin/clion/bin"
fi

# pycharm IDE path
if [ -d "$home_bin/pycharm/bin" ]; then
  export PATH="$PATH:$home_bin/pycharm/bin"
fi

# intellij IDE path
if [ -d "$home_bin/intellij/bin" ]; then
  export PATH="$PATH:$home_bin/intellij/bin"
fi

if [ -d "$home_bin/SalaeaLogic" ]; then
  export PATH="$PATH:$home_bin/SalaeaLogic"
fi

# ninja build system tab completion
if command -v ninja >/dev/null 2>&1; then
  source /etc/bash_completion.d/ninja
fi

export GCC_COLORS='error=01;41:warning=01;93:note=01;36:caret=01;32:locus=01:quote=01'
