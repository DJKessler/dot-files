alias adc='cd $HOME/git/TSL/picosat_adc/'
alias cdh='cd $HOME/git/TSL/picosat_cdh/'
alias cmn='cd $HOME/git/TSL/picosat_cmn/'
alias gui='cd $HOME/git/TSL/picosat_gui/'
alias lib='cd $HOME/git/TSL/picosat_lib/'
alias sim='cd $HOME/git/TSL/picosat_sim/'

alias oop='cd $HOME/git/UTCS/2014F/cs371p/'
alias bdp='cd $HOME/git/UTCS/2014F/cs378/'
alias opsys='cd $HOME/git/UTCS/2014F/cs439/'

export oop=$HOME/git/UTCS/2014F/cs371p/
export bdp=$HOME/git/UTCS/2014F/cs378/
export opsys=$HOME/git/UTCS/2014F/cs439/


#  USEFUL BASH FUNCTIONS
if [ -f $HOME/.unixrc/.bash_functions ]; then
	. $HOME/.unixrc/.bash_functions
fi

#  BASH COLOR ALIASES
if [ -f $HOME/.unixrc/.bash_colors ]; then
  . $HOME/.unixrc/.bash_colors
fi

# Various variables you might want for your PS1 prompt instead
export Time12h="\T"
export Time12a="\@"
export PathShort="\W"
export PathFull="\w"
export NewLine="\n"
export Jobs="\j"

if [ "$(hostname -s)" == "cowboy" ]; then
  . $HOME/.bash_adcirc
  export psWhere="COWBOY"
  export psWho="DJKESSLER"
	export pscolor=$BIDarkRed
	export delimColor=$BIPurple
	. $HOME/.git-prompt.sh
elif [[ "$(hostname -s)" =~ "compute-0-"$* ]]; then
  . $HOME/.bash_adcirc
  export psWhere="$(hostname -s)"
  export psWho="DJKESSLER"
	export pscolor=$BIDarkRed
	export delimColor=$BICyan
elif [ "$(hostname -s)" == "DJKubuntu" ]; then
  export psWhere="$(hostname -s)"
  export psWho="djkessler"
	export pscolor=$BIBlue
	export delimColor=$BIYellow
elif [ "$(hostname -s)" == "djk_hackpro" ]; then
  export psWhere="$(hostname -s)"
  export psWho="DJKessler"
	export pscolor=$Blue
	export delimColor=$Yellow
elif [ "$(scutil --get ComputerName)" == "DJK_MBA" ]; then
  export psWhere="$(scutil --get ComputerName)"
  export psWho="DJKessler"
	export pscolor=$BIBlue
	export delimColor=$BIYellow
elif [ "$USER" == "vagrant" ]; then
	export pscolor=$Red
	export delimColor=$BIBlack
elif [ "$OSTYPE" != "msys" ]; then
	export pscolor=$BIBlue
	export delimColor=$BIYellow
fi

export PS1PATH="\W"
if [ "$USER" == "vagrant" ]; then
	if [ "$color_prompt" = yes ]; then
		export PS1='$ '$Color_Off
		export PS1='\W '$PS1
		export PS1=$BIRed'\D{%M} '$PS1
		export PS1=$BIRed':'$PS1
		export PS1=$BIRed'\D{%H}'$PS1
		export PS1=$BIRed'] '$PS1
		export PS1=$BIRed'\h'$PS1
		export PS1=$BIRed'@'$PS1
		export PS1=$BIRed'\u'$PS1
		export PS1=$BIRed'['$PS1
	else
		export PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
	fi
fi

export PS1=$delimColor'['
export PS1=$PS1$pscolor$psWho
export PS1=$PS1$delimColor'@'
export PS1=$PS1$pscolor$psWhere
export PS1=$PS1$delimColor']'
#export PS1=$PS1$BIBlack$Time12h
export PS1=$PS1$Color_Off'$(git branch &>/dev/null; \
	if [ $? -eq 0 ]; then \
		echo "$(echo $(git status) | grep "nothing to commit" > /dev/null 2>&1; \
		if [ "$?" -eq "0" ]; then \
			echo "'$Green'"$(__git_ps1 " (%s)"); \
		else \
			echo "'$BIRed'"$(__git_ps1 " {%s}"); \
		fi) '$BYellow$PS1PATH$Color_Off'\$ "; \
	else \
		echo " '$Yellow$PS1PATH$Color_Off'\$ "; \
	fi)'
