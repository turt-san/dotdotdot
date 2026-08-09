tmuxc() {
    if [[ -n "$TMUX" ]]; then
        echo "tmux is running, don't do that bro."
        return 1
    fi
    dir="$PROJECTS_DIR/Sandbox/$1"
    tmux new-session -c "$dir" -e Z_TMUX_CODE=true -s code -d -n nvim
    tmux new-window -c "$dir" -d -t code:2 -n alt
    tmux split-window -hd -l 20% -t code:nvim.1 ''
    # tmux split-window -v -d -t code:nvim.1 top
    # tmux split-window -h -d -t code:1.2 top
    tmux attach -t code
}

# ==============================   CONVERT TO NVIM SPLIT x3
tmuxweb() {
    if [[ -n "$TMUX" ]]; then
        echo "tmux is running, don't do that bro."
        return 1
    fi
    size=($(stty size))
    hpre=$(("${size[2]}" * 400 / 100))
    if [[ "${#hpre}" -lt 2 ]]; then
        h=1
    else
        ((h = (hpre + 4) / 10))
        echo "$hpre -> $h"
    fi

    dir="$PROJECTS_DIR/WEB/$1"
    tmux new-session -c "$dir" -e Z_TMUX_WEB=true -s web -d -n main nvim "js/main.js" "+rightbelow ${h}vsplit style.css" "+split index.html" "+1wincmd w"
    tmux new-window -c "$dir" -d -t web:2 -n server python -m http.server
    # tmux split-window -c "$dir" -hd -l 40% -t web:main.1
    # tmux split-window -c "$dir" -vd -l 50% -t web:main.2
    tmux attach -t web
}

tmuxrbx() {
    dir="$PROJECTS_DIR/ROBLOX/$1/src"
    tmux new-session -c "$dir" -s rbx -n rojomap
}
