# gnu utils for osx
if [ -d $(brew --prefix)/opt/coreutils/libexec/gnubin/ ]; then
  export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
fi
if [ -d $(brew --prefix)/opt/coreutils/libexec/gnuman/ ]; then
  export MANPATH="$(brew --prefix)/opt/coreutils/libexec/gnuman:$MANPATH"
fi

if [ -d $(brew --prefix)/opt/gnu-sed/libexec/gnubin/ ]; then
  export PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"
fi
if [ -d $(brew --prefix)/opt/gnu-sed/libexec/gnuman/ ]; then
  export MANPATH="$(brew --prefix)/opt/gnu-sed/libexec/gnuman:$MANPATH"
fi

if [ -d $(brew --prefix)/opt/gnu-tar/libexec/gnubin/ ]; then
  export PATH="$(brew --prefix)/opt/gnu-tar/libexec/gnubin:$PATH"
fi

if [ -d "/Applications/User_Applications/Mathematica.app/Contents/MacOS" ]; then
  alias math="/Applications/User_Applications/Mathematica.app/Contents/MacOS/MathKernel"
fi

# bash aliases for osx
alias ls='ls -lh -G'

LSCOLORS=1

if [ -f /Volumes/EFI/EFI/CLOVER/config.plist ]; then
	alias config="vim /Volumes/EFI/EFI/CLOVER/config.plist"
  export clover="/Volumes/EFI/EFI/CLOVER/"
fi

# copyTag is a function that copies the finder tag from arg 1, to arg 2
copyTag() {
	sudo xattr -wx com.apple.metadata:_kMDitemUserTags \
    "$(xattr -px	com.apple.metadata:_kMDItemUserTags "$1")" "$2";
	sudo xattr -wx com.apple.FinderInfo \
    "$(xattr -px com.apple.FinderInfo	"$1")" "$2";
}

if [ "$(hostname -s)" == "djk_hackpro" ]; then
  export psWhere="$(hostname -s)"
  export psWho="DJKessler"
	export pscolor=$Blue
	export delimColor=$Yellow
elif [ "$(scutil --get ComputerName)" == "DJK_MBA" ]; then
  export psWhere="$(scutil --get ComputerName)"
  export psWho="DJKessler"
	export pscolor=$BIBlue
	export delimColor=$BIYellow
fi
