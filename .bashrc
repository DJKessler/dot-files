# ~/.bashrc: executed by bash(1) for non-login shells.

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
		# If not running interactively, don't do anything
		case $- in
		    *i*) ;;
		      *) return;;
		esac
		# set variable identifying the chroot you work in (used in the prompt below)
		if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
		    debian_chroot=$(cat /etc/debian_chroot)
		fi
		
		# set a fancy prompt (non-color, unless we know we "want" color)
		case "$TERM" in
		    xterm-color) color_prompt=yes;;
		esac
		# If this is an xterm set the title to user@host:dir
		case "$TERM" in
		xterm*|rxvt*)
		    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
		    ;;
		*)
		    ;;
		esac
elif [[ "$OSTYPE" == "darwin"* ]]; then
	# this is a mac
		if [ -f $(brew --prefix)/etc/bash_completion ]; then
			. $(brew --prefix)/etc/bash_completion
		fi
		export CLICOLOR=1
		export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# attempt to save all lines of a multiple line command in the same history
# entry. This allows easy re-editing of multi line commands.
shopt -s cmdhist 

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2222
HISTFILESIZE=100000

# set the history entry timestamp format
HISTTIMEFORMAT="%Y%m%d-%T "

# set the commands that should not be saved to history
HISTIGNORE="&:pwd:clear:ls:[bf]g:exit:[ \t]*"

# the contents of the PROMPT_COMMAND environement variable are executed as a
# regular bash command just before Bash displays a prompt
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

#unset color_prompt force_color_prompt

# Alias definitions.
if [ -f ~/.unixrc/.bash_aliases ]; then
    . ~/.unixrc/.bash_aliases
fi
