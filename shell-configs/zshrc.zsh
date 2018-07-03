# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000
setopt appendhistory beep nomatch
unsetopt autocd extendedglob notify
bindkey -e
bindkey "" history-incremental-pattern-search-backward

# enable Ctrl+arrow word movement
bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word

dot_dir="$HOME/.dot-files"
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

export PATH="$(getconf PATH):/usr/sbin:/usr/lib:/usr/local/bin"

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
source "$ZSH_CUSTOM/aliases/cmake-arm.zsh"
source "$ZSH_CUSTOM/keybindings.zsh"
source "$ZSH_CUSTOM/macOs.zsh"
source "$ZSH_CUSTOM/linux.zsh"

local_dir="$HOME/.local"

if [ -d $local_dir ]; then
  export PATH="$PATH:$local_dir/bin"
fi

export GCC_COLORS='error=01;41:warning=01;93:note=01;36:caret=01;32:locus=01:quote=01'
alias ls='ls -l --color=auto'

alias dirs='dirs -v'
