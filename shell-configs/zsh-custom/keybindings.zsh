# zsh-autosuggestion keybindings
bindkey '^ ' autosuggest-accept

# bind i-search to match previous commands that have the same beginning as the
# typed string
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward
