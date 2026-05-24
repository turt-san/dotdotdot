alias cdaa="sudo -E nvim /usr/share/cachyos-zsh-config/cachyos-config.zsh"
alias r="clear; exec "$SHELL""
alias rw="killall -SIGUSR2 waybar"
alias ls="ls -la --color=auto"
alias svim="sudo -E nvim "
alias spac="sudo pacman "
alias todo="nvim ~/todo.md"
alias py="python "
# python source
alias psrc="source $pyenvdir/bin/activate"
# git add commit all
alias gaca='git add . ; git commit --all --verbose --message'
# ssh: OPEN
alias ssho='eval $(ssh-agent) ; ssh-add ~/.ssh/keys/*'
alias blk='feh --fullscreen --hide-pointer ~/Images/Pictures/black.png &; disown; exit'
alias upd='cachy-update'
