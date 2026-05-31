pyenvdir='~/Sandbox/PYTHON/.venv/'

alias cdaa="sudo -E nvim /usr/share/cachyos-zsh-config/cachyos-config.zsh"
alias re="clear; exec $SHELL"
alias rw="killall -SIGUSR2 waybar"
alias svim="sudo -E nvim "
alias spac="sudo pacman "
alias todo="nvim ~/todo.md"
alias py="python3 "
# python source
alias pysrc="source $pyenvdir/bin/activate"
alias blk='feh --fullscreen --hide-pointer ~/Images/Other/black.png &; disown; exit'
alias upd='cachy-update'
alias alph="echo {a..z}"

if [[ -n $(command -v eza) ]]; then
    alias ls="command eza -al --time-style=+\"|\" --sort=Extension --color=auto"
    alias ll="command eza -aagl --color=auto"
else
    alias ls="command ls -AXGl --time-style=+\"|\" --color=auto"
    alias ll="command ls -al --color=auto"
fi
