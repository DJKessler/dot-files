# determine if this is a mac or linux machine

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	# this is ubuntu
		# enable color support of ls and also add handy aliases
		if [ -x /usr/bin/dircolors ]; then
		    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
				alias ls='ls -lh --color=auto'
		    alias grep='grep --color=auto'
		fi
		if [ $USER == "vagrant" ]; then
			myHomeDir=/vagrant
		else
			myHomeDir=$HOME/git
		fi
		alias adc='cd $myHomeDir/picosat_adc/'
		alias cdh='cd $myHomeDir/picosat_cdh/'
		alias cmn='cd $myHomeDir/picosat_cmn/'
		alias gui='cd $myHomeDir/picosat_gui/'
		alias lib='cd $myHomeDir/picosat_lib/'
		alias sim='cd $myHomeDir/picosat_sim/'

		if [ -f /usr/bin/colormake ]; then
			export alias make='colormake'
		fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
	# this is a mac
	alias math="/Applications/User_Applications/Mathematica.app/Contents/MacOS/MathKernel"
	alias hg="/usr/local/bin/hg"
	alias ls='ls -lh -G'
	alias adc='cd ~/Documents/TSL/picosat_adc/'
	alias cmn='cd ~/Documents/TSL/picosat_cmn/'
	alias gui='cd ~/Documents/TSL/picosat_gui/'
	if [ -f /Volumes/EFI/EFI/CLOVER/config.plist ]; then
		alias config="vim /Volumes/EFI/EFI/CLOVER/config.plist"
	fi
	# copyTag is a function that copies the finder tag from arg 1, to arg 2
	copyTag() {
		sudo xattr -wx com.apple.metadata:_kMDitemUserTags "$(xattr -px	com.apple.metadata:_kMDItemUserTags "$1")" "$2";
		sudo xattr -wx com.apple.FinderInfo "$(xattr -px com.apple.FinderInfo	"$1")" "$2"; 
	}
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
export alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#  Customize BASH PS1 prompt to show current GIT repository and branch.

#  SETUP CONSTANTS
#  Bunch-o-predefined colors.  Makes reading code easier than escape sequences.

# Reset
export Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
export Black="\[\033[0;30m\]"        # Black
export Red="\[\033[0;31m\]"          # Red
export Green="\[\033[0;32m\]"        # Green
export Yellow="\[\033[0;33m\]"       # Yellow
export Blue="\[\033[0;34m\]"         # Blue
export Purple="\[\033[0;35m\]"       # Purple
export Cyan="\[\033[0;36m\]"         # Cyan
export White="\[\033[0;37m\]"        # White

# Bold
export BBlack="\[\033[1;30m\]"       # Black
export BRed="\[\033[1;31m\]"         # Red
export BGreen="\[\033[1;32m\]"       # Green
export BYellow="\[\033[1;33m\]"      # Yellow
export BBlue="\[\033[1;34m\]"        # Blue
export BPurple="\[\033[1;35m\]"      # Purple
export BCyan="\[\033[1;36m\]"        # Cyan
export BWhite="\[\033[1;37m\]"       # White

# Underline
export UBlack="\[\033[4;30m\]"       # Black
export URed="\[\033[4;31m\]"         # Red
export UGreen="\[\033[4;32m\]"       # Green
export UYellow="\[\033[4;33m\]"      # Yellow
export UBlue="\[\033[4;34m\]"        # Blue
export UPurple="\[\033[4;35m\]"      # Purple
export UCyan="\[\033[4;36m\]"        # Cyan
export UWhite="\[\033[4;37m\]"       # White

# Background
export On_Black="\[\033[40m\]"       # Black
export On_Red="\[\033[41m\]"         # Red
export On_Green="\[\033[42m\]"       # Green
export On_Yellow="\[\033[43m\]"      # Yellow
export On_Blue="\[\033[44m\]"        # Blue
export On_Purple="\[\033[45m\]"      # Purple
export On_Cyan="\[\033[46m\]"        # Cyan
export On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
export BIBlack="\[\033[1;90m\]"      # Black
export BIRed="\[\033[1;91m\]"        # Red
export BIGreen="\[\033[1;92m\]"      # Green
export BIYellow="\[\033[1;93m\]"     # Yellow
export BIBlue="\[\033[1;94m\]"       # Blue
export BIPurple="\[\033[1;95m\]"     # Purple
export BICyan="\[\033[1;96m\]"       # Cyan
export BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
export On_IBlack="\[\033[0;100m\]"   # Black
export On_IRed="\[\033[0;101m\]"     # Red
export On_IGreen="\[\033[0;102m\]"   # Green
export On_IYellow="\[\033[0;103m\]"  # Yellow
export On_IBlue="\[\033[0;104m\]"    # Blue
export On_IPurple="\[\033[10;95m\]"  # Purple
export On_ICyan="\[\033[0;106m\]"    # Cyan
export On_IWhite="\[\033[0;107m\]"   # White

# Various variables you might want for your PS1 prompt instead
#Time12h="\T"
#Time12a="\@"
export PathShort="\w"
export PathFull="\W"
export NewLine="\n"
export Jobs="\j"

if [ $USER == "vagrant" ]; then
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
else
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
				echo "'$IRed'"$(__git_ps1 " {%s}"); \
			fi) '$BYellow$PathShort$Color_Off'\$ "; \
		else \
			echo " '$Yellow$PathShort$Color_Off'\$ "; \
		fi)'
fi
