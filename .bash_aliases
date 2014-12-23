alias adc='cd $HOME/git/picosat_adc/'
alias cdh='cd $HOME/git/picosat_cdh/'
alias cmn='cd $HOME/git/picosat_cmn/'
alias gui='cd $HOME/git/picosat_gui/'
alias lib='cd $HOME/git/picosat_lib/'
alias sim='cd $HOME/git/picosat_sim/'

alias oop='cd $HOME/git/UTCS/2014F/cs371p/'
alias bdp='cd $HOME/git/UTCS/2014F/cs378/'
alias opsys='cd $HOME/git/UTCS/2014F/cs439/'

export oop=$HOME/git/UTCS/2014F/cs371p/
export bdp=$HOME/git/UTCS/2014F/cs378/
export opsys=$HOME/git/UTCS/2014F/cs439/

# Various variables you might want for your PS1 prompt instead
export Time12h="\T"
export Time12a="\@"
export PathShort="\W"
export PathFull="\w"
export NewLine="\n"
export Jobs="\j"

export PS1PATH="\W"

export PS1=$delimColor'['
export PS1=$PS1$pscolor$psWho
export PS1=$PS1$delimColor'@'
export PS1=$PS1$pscolor$psWhere
export PS1=$PS1$delimColor']'
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
