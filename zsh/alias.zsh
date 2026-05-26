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
# ssh: OPEN
alias ssho='eval $(ssh-agent) ; ssh-add ~/.ssh/keys/*'
alias blk='feh --fullscreen --hide-pointer ~/Images/Other/black.png &; disown ; exit'
alias upd='cachy-update'

if [[ -n $(command -v eza) ]]; then
    alias ls="eza -a1 --color=auto"
    alias ll="eza -la --color=auto"
else
    alias lls="ls -a1 --color=auto"
    alias ll="ls -la --color=auto"
fi
