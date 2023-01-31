# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zinit/zinit.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source .zshplugins
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
alias h='fc -lt '%F %T' 1'
zstyle ':completion:*:default' menu select=1
PROMPT='%#%n %d$ '
export EDITOR=nvim
export XIM_PROGRAM="/usr/bin/ibus-daemon -xdrt"
export DENO_INSTALL="/home/kuonruri/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="/home/kuonruri/.local/bin:$PATH"
export VAGRANT_DEFAULT_PROVIDER="kvm"
export GLFW_IM_MODULE="ibus"
export GTK_IM_MODULE=ibus
zstyle ':completion::complete:*' use-cache true

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
