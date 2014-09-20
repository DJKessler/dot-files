alias adc='cd $myHomeDir/picosat_adc/'
alias cdh='cd $myHomeDir/picosat_cdh/'
alias cmn='cd $myHomeDir/picosat_cmn/'
alias gui='cd $myHomeDir/picosat_gui/'
alias lib='cd $myHomeDir/picosat_lib/'
alias sim='cd $myHomeDir/picosat_sim/'

# determine if this is a mac or linux machine
#if [[ "$OSTYPE" == "linux-gnu" ]]; then
#	# this is ubuntu
#  if [ -f $HOME/.unixrc/.bash_alias_ubuntu ]; then
#    . $HOME/.unixrc/.bash_alias_ubuntu
#  fi
#elif [[ "$OSTYPE" == "darwin"* ]]; then
#	# this is a mac
#  if [ -f $HOME/.unixrc/.bash_alias_osx ]; then
#    . $HOME/.unixrc/.bash_alias_osx
#  fi
#fi

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

export PS1PATH="\W"
#  Customize BASH PS1 prompt to show current GIT repository and branch.
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
elif [ "$OSTYPE" != "msys" ]; then
	export PS1=$BIYellow'['
	export PS1=$PS1$BIBlue'\h'
	export PS1=$PS1$BIYellow'@'
	export PS1=$PS1$BIBlue'\u'
	export PS1=$PS1$BIYellow'] '
	export PS1=$PS1$BIBlack$Time12h
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
fi
