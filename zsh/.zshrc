local red='\033[4;31m'
local reset='\033[0m'
local white='\033[1;4;33m'
local sred='\x1b[38;2;255;0;0m'
local syellow='\x1b[38;2;255;255;0m\033[4m'
echo "hi, today is "$sred"Week $(date +'%V')"$reset"$syellow"
if [[ -f ~/motd.md ]]; then
    cat ~/motd.md
fi
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
