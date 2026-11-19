pyenvdir="$PROJECTS_DIR/py/.venv"

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
alias alph="echo {a..z}"
alias wallyfix='wally-package-types --sourcemap sourcemap.json Packages/'
alias gpull='ssho && git pull'

# cd ..
# ".." is a function
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

if [[ -n $(command -v eza) ]]; then
    alias ls="command eza -al --time-style=+\"|\" --sort=Extension --color=auto"
    alias ll="command eza -aagl --color=auto"
else
    alias ls="command ls -AXGl --time-style=+\"|\" --color=auto"
    alias ll="command ls -al --color=auto"
fi

if [[ -n $(command -v cachy-update) ]]; then
    alias upd="yes $'\n' | cachy-update"
elif [[ -n $(command -v arch-update) ]]; then
    alias upd="yes $'\n' | arch-update"
else
    alias upd='echo Neither cachy-update or arch-update is installed'
fi
