pyenvdir='~/Sandbox/PYTHON/.venv/'

alias cdaa="sudo -E nvim /usr/share/cachyos-zsh-config/cachyos-config.zsh"
alias re="clear; exec $SHELL"
alias rw="killall -SIGUSR2 waybar"
alias svim="sudo -E nvim "
alias spac="sudo pacman "
alias todo="nvim ~/todo.md"
alias py="python "
# python source
alias pysrc="source $pyenvdir/bin/activate"
alias blk='feh --fullscreen --hide-pointer ~/Images/Other/black.png &; disown; exit'
alias upd='cachy-update'

lsargs="-AXgl --time-style=+\"|\" --color=auto"
llargs="-al --color=auto"
if [[ -n $(command -v eza) ]]; then
    alias ls="command eza $lsargs"
    alias ll="command eza $llargs"
else
    alias ls="command ls $lsargs"
    alias ll="command ls $llargs"
fi
