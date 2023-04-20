# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zinit/zinit.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source ~/Dotfiles/zsh/.zsh_options
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light romkatv/powerlevel10k
autoload -U compinit; compinit
autoload -Uz colors ; colors
autoload -U colors ; colors ; zstyle ':completion:*' list-colors "${LS_COLORS}"
set -g default-terminal "screen-256color"
alias h='fc -lt '%F %T' 1'
alias ls='ls -al'
zstyle ':completion:*:default' menu select=1
export EDITOR=nvim
export XIM_PROGRAM="/usr/bin/ibus-daemon -xdrt"
export DENO_INSTALL="/home/kuonruri/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="/home/kuonruri/.local/bin:$PATH"
export VAGRANT_DEFAULT_PROVIDER="kvm"
export GLFW_IM_MODULE=ibus
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
HISTFILE=~/Dotfiles/zsh/.zsh_history
SAVEHIST=100000
HISTSIZE=1000
PROMPT='%#%n %d$ '
zstyle ':completion::complete:*' use-cache true

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
