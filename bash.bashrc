##
## begin performance profiling of bashrc
##
#PS4='+ $(date "+%s.%N")\011 '
#exec 3>&2 2>/tmp/bashstart.$$.log
#set -x


export EDITOR=/usr/bin/vim

if [ "$USER" == "vagrant" ]; then
	export myHomeDir=/vagrant
elif [ -d $HOME/git/TSL/ ]; then
	export myHomeDir=$HOME/git/TSL
else
  export myHomeDir=$HOME/git
fi

#  USEFUL BASH FUNCTIONS
if [ -f "$HOME/.unixrc/bash.functions" ]; then
	. "$HOME/.unixrc/bash.functions"
fi

#  BASH COLOR ALIASES
if [ -f $HOME/.unixrc/bash.colors ]; then
  . $HOME/.unixrc/bash.colors
fi

if [[ "$OSTYPE" == "linux-gnu" ]] || [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH=$(getconf PATH)
fi

# determine if this is a mac or linux machine
if [[ "$OSTYPE" == "linux-gnu" ]]; then ######################### this is ubuntu
  export PATH="$PATH:/sbin:/usr/sbin:/usr/lib:/usr/local/bin:/usr/local/sbin"
  if [ -f $HOME/.unixrc/bash.bashrc_linux ]; then
    . $HOME/.unixrc/bash.bashrc_linux
  fi
  if [ -f $HOME/.unixrc/bash.aliases_linux ]; then
    . $HOME/.unixrc/bash.aliases_linux
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then ############################ this is osx
  export PATH="$PATH:/usr/local/bin:/opt/X11/bin:/usr/texbin:/usr/local/git/bin"
  if [ -f $HOME/.unixrc/bash.bashrc_osx ]; then
    . $HOME/.unixrc/bash.bashrc_osx
  fi
  if [ -f $HOME/.unixrc/bash.aliases_osx ]; then
    . $HOME/.unixrc/bash.aliases_osx
  fi
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# export HISTCONTROL=ignoredups:erasedups

# attempt to save all lines of a multiple line command in the same history
# entry. This allows easy re-editing of multi line commands.
# shopt -s cmdhist

# append to the history file, don't overwrite it
# shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=100000
export HISTFILESIZE=1000000
export HISTCONTROL=ignorespace:ignoredups

#
# override the bash's default history() function
#
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
#export HISTIGNORE="&:pwd:clear:[bf]g:exit:[ \t]*"
export HISTIGNORE="[bf]g:exit"

# the contents of the PROMPT_COMMAND environement variable are executed as a
# regular bash command just before Bash displays a prompt
#export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes
color_prompt=yes

#unset color_prompt force_color_prompt

# Alias definitions.
if [ -f $HOME/.unixrc/bash.aliases ]; then
	source $HOME/.unixrc/bash.aliases
fi

# git repo status in ps1
if [ -f $HOME/.unixrc/git-prompt.sh ]; then
	source $HOME/.unixrc/git-prompt.sh
fi

# cross compile toolchain
if [ -d $HOME/arm-toolchain/usr/bin ]; then
  export PATH="$PATH:$HOME/arm-toolchain/usr/bin"
fi

# clion IDE path
if [ -d $HOME/.bin/clion/bin ]; then
  export PATH="$PATH:$HOME/.bin/clion/bin"
fi

# intellij IDE path
if [ -d $HOME/.bin/idea/bin ]; then
  export PATH="$PATH:$HOME/.bin/idea/bin"
fi


# ninja build system tab completion
if command -v ninja >/dev/null 2>&1; then
  source /etc/bash_completion.d/ninja
fi

[[ $COLORTERM = gnome-terminal ]] && TERM=xterm-256color

export GCC_COLORS='error=01;41:warning=01;93:note=01;36:caret=01;32:locus=01:quote=01'

##
## end performance profiling of bashrc
##
#set +x
#exec 2>&3 3>&-
