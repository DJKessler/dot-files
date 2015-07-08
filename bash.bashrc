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
  if [ -f $HOME/.unixrc/bash.bashrc_linux]; then
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
elif [[ "$OSTYPE" == msys ]]; then ############################# this is windows
	myHomeDir=$HOME
	SSH_ENV=$HOME/.ssh/environment

	# start the ssh-agent
	function start_agent {
	    echo "Initializing new SSH agent..."
	    # spawn ssh-agent
	    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
	    echo succeeded
	    chmod 600 "${SSH_ENV}"
	    . "${SSH_ENV}" > /dev/null
	    /usr/bin/ssh-add
	}

	if [ -f "${SSH_ENV}" ]; then
	     . "${SSH_ENV}" > /dev/null
	     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
	        start_agent;
	    }
	else
	    start_agent;
	fi
	export PATH=$PATH:"/c/Program Files (x86)/Microsoft Visual Studio 11.0/Common7/IDE/"
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
export HISTSIZE=10000
export HISTFILESIZE=100000
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
# set the commands that should not be saved to history
#export HISTIGNORE="&:pwd:clear:[bf]g:exit:[ \t]*"

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
	. $HOME/.unixrc/bash.aliases
fi

if [ -f $HOME/.unixrc/git-prompt.sh ]; then
	. $HOME/.unixrc/git-prompt.sh
fi


if [ -d $HOME/arm-toolchain/usr/bin ]; then
  export PATH="$PATH:$HOME/arm-toolchain/usr/bin"
fi
