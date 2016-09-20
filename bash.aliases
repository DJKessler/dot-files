alias adc='pushd $HOME/git/picosat_adc/'
alias cdh='pushd $HOME/git/picosat_cdh/'
alias cmn='pushd $HOME/git/picosat_cmn/'
alias gui='pushd $HOME/git/picosat_gui/'
alias asteria='pushd $HOME/Documents/asteria/'

# Various variables you might want for your PS1 prompt instead
export PathShort="\W"
export PathFull="\w"
export PS1PATH="$PathFull"

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
		fi) '$BYellow$PS1PATH$Color_Off' \$ "; \
	else \
		echo " '$BYellow$PS1PATH$Color_Off' \$ "; \
	fi)'
