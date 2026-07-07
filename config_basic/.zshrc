# Created by newuser for 5.9

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

eval "$(starship init zsh)"

RED='\e[1;31m'
NC='\e[0m'

version() {
echo -e "
${RED}CentrixCL v0.0.9${NC}
----------------------
${RED}Developer  :${NC} JIRT2007
${RED}Repository :${NC} https://github.com/JIRT2007/CentrixCL
${RED}Web Site   :${NC} https://jirt2007.github.io/webCENTRIX/
${RED}WM         :${NC} Hyprland
"
}

alias cmenu="~/CentrixCL/manager.sh"
