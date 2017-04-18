# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
setopt appendhistory beep nomatch
unsetopt autocd extendedglob notify
bindkey -e
bindkey "" history-incremental-pattern-search-backward

# enable Ctrl+arrow word movement
bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word

dot_dir="$HOME/.unixrc"
shell_cfg_dir="$dot_dir/shell-configs"

base16_shell_dir="$shell_cfg_dir/base16-shell"
base16_xres_dir="$shell_cfg_dir/base16-xresources"

## setup base16 colorscheme
if [ -d "$base16_shell_dir" ]; then
  if [ "$PS1" ] && [ -s "$shell_cfg_dir/profile_helper.sh" ]; then
    eval "$($shell_cfg_dir/profile_helper.sh)"
  fi
fi

## setup base16 xresources
if [ -d "$base16_xres_dir" ]; then
  [ ! -f ~/.base16_theme ] && base16_brewer
fi

# export PATH=$(getconf PATH)
export PATH="$(getconf PATH):/sbin:/usr/sbin:/usr/lib:/usr/local/bin:/usr/local/sbin"

# Path to your oh-my-zsh installation.
export ZSH="$shell_cfg_dir/oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gianu"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$shell_cfg_dir/zsh-custom"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to $ZSH/custom/plugins/
plugins=(git zsh-completions zsh-autosuggestions ssh-agent pip)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# cross compile toolchain
if [ -d "$HOME/arm-toolchain/usr/bin" ]; then
  export PATH="$PATH:$HOME/arm-toolchain/usr/bin"
  alias cmake-arm="$HOME/arm-toolchain/usr/bin/cmake -DCMAKE_TOOLCHAIN_FILE=$HOME/arm-toolchain/usr/share/buildroot/toolchainfile.cmake"
fi

local_dir="$HOME/.local"

# clion IDE path
if [ -d "$local_dir/clion/bin" ]; then
  export PATH="$PATH:$local_dir/clion/bin"
fi

# pycharm IDE path
if [ -d "$local_dir/pycharm/bin" ]; then
  export PATH="$PATH:$local_dir/pycharm/bin"
fi

# intellij IDE path
if [ -d "$local_dir/intellij/bin" ]; then
  export PATH="$PATH:$local_dir/intellij/bin"
fi

if [ -d "$local_dir/SalaeaLogic" ]; then
  export PATH="$PATH:$local_dir/SalaeaLogic"
fi

if [ -d /usr/lib/ccache ]; then
	export PATH="/usr/lib/ccache:$PATH"
fi

export GCC_COLORS='error=01;41:warning=01;93:note=01;36:caret=01;32:locus=01:quote=01'
alias ls='ls -l --color=auto'