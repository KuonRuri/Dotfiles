bindkey -e
autoload -U compinit; compinit
autoload -Uz colors ; colors
autoload -U colors ; colors ; zstyle ':completion:*' list-colors "${LS_COLORS}"
set -g default-terminal "screen-256color"
setopt auto_pushd
setopt pushd_ignore_dups
setopt extended_glob
setopt hist_ignore_space
setopt auto_param_keys
setopt print_exit_value
setopt correct
setopt correct_all
setopt histignorealldups
setopt share_history
setopt hist_reduce_blanks
setopt inc_append_history
setopt hist_verify
setopt 
alias h='fc -lt '%F %T' 1'
zstyle ':completion:*:default' menu select=1
PROMPT='%#%n %d$ '
export EDITOR=nvim
zstyle ':completion::complete:*' use-cache true
