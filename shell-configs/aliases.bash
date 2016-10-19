alias adc='pushd $HOME/git/picosat_adc/'
alias cdh='pushd $HOME/git/picosat_cdh/'
alias cmn='pushd $HOME/git/picosat_cmn/'
alias gui='pushd $HOME/git/picosat_gui/'
alias asteria='pushd $HOME/Documents/asteria/'

PROMPT_DIRTRIM=2

function user_at_host {
  local __open="$delimColor["
  local __shut="$delimColor]$Color_Off"
  local __who="$pscolor\u"
  local __sep="$delimColor@"
  local __where="$pscolor\h"
  echo "$__open$__who$__sep$__where$__shut"
}

function color_path {
  echo "$BYellow\w$Color_Off"
}

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWCOLORHINTS=true
export PROMPT_COMMAND='__git_ps1 "$(user_at_host) $(color_path)" " \\\$ "'
