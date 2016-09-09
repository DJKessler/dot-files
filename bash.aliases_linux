# bash aliases for linux

##
## print an alert msg after a long running command finishes
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
		alias ls='ls -lh --color=auto'
    alias grep='grep --color=auto'
fi

if [ -f /usr/bin/colormake ]; then
	alias MAKE='colormake --short'
fi

if [ -f /usr/bin/minicom ]; then
  alias minicom='TERM=linux minicom -c on'
fi

if [ -f /usr/bin/make ]; then
  alias pmake='make -j4'
fi

alias myip="ip route get 8.8.8.8 | awk '{print $NF; exit}'"

if [ "$(hostname -s)" == "DJKubuntu" ]; then
  export psWhere="$(hostname -s)"
  export psWho="djkessler"
	export pscolor=$BIBlue
	export delimColor=$BIYellow
elif [ "$USER" == "vagrant" ]; then
  export psWhere="VAGRANT"
  export psWho="VAGRANT"
	export pscolor=$Red
	export delimColor=$BIBlack
elif [ "$(hostname -s)" == "cowboy" ]; then
  . $HOME/.bash_adcirc
  export psWhere="COWBOY"
  export psWho="DJKESSLER"
	export pscolor=$BIRed
	export delimColor=$BIPurple
	. $HOME/.git-prompt.sh
elif [[ "$(hostname -s)" =~ "compute-0-"$* ]]; then
  . $HOME/.bash_adcirc
  export psWhere="$(hostname -s)"
  export psWho="DJKESSLER"
	export pscolor=$BIRed
	export delimColor=$BICyan
else
  export psWhere="$(hostname -s)"
  export psWho=$USER
	export pscolor=$BIRed
	export delimColor=$BICyan
fi
