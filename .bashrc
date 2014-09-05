# $myHomeDir/.bashrc: executed by bash(1) for non-login shells.

# determine if this is a mac or linux machine
if [[ "$OSTYPE" == "linux-gnu" ]]; then
# this is ubuntu
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
	if [ $USER == "vagrant" ]; then
		myHomeDir=/home/vagrant
	else
		myHomeDir=$HOME
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
elif [[ "$OSTYPE" == "darwin"* ]]; then
# this is a mac
	myHomeDir=$HOME
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
	fi
	export CLICOLOR=1
	export LSCOLORS=Exfxcxdxbxegedabagacad
	export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/texbin"
elif [[ "$OSTYPE" == msys ]]; then
# this is windows
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
export HISTCONTROL=ignoredups:erasedups

# attempt to save all lines of a multiple line command in the same history
# entry. This allows easy re-editing of multi line commands.
shopt -s cmdhist 

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=10000
export HISTFILESIZE=100000

# set the history entry timestamp format
#export HISTTIMEFORMAT="%Y%m%d-%T "

# set the commands that should not be saved to history
export HISTIGNORE="&:pwd:clear:ls*:[bf]g:exit:[ \t]*"

# the contents of the PROMPT_COMMAND environement variable are executed as a
# regular bash command just before Bash displays a prompt
export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes
color_prompt=yes

#unset color_prompt force_color_prompt

# Alias definitions.
if [ -f $myHomeDir/.unixrc/.bash_aliases ]; then
	. $myHomeDir/.unixrc/.bash_aliases
fi
