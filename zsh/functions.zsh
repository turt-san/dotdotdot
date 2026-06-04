# emulate -LR zsh
mkcdir() {
    mkdir $1
    cd $1
}

# ssh: OPEN
ssho() {
    eval $(ssh-agent)
    ssh-add ~/.ssh/keys/*
}

# git add commit all
gaca() {
    if [[ -z $SSH_AGENT_PID ]]; then
        ssho
    fi
    git add .
    git commit --all --verbose --message "$*"
    git push
}

goodnight() {
    killall -15 brave
    if [[ "$1" = "-r" ]]; then
        echo restarting
        shutdown -r "+0"
    else
        shutdown -h "+0"
    fi
}

..() {
    cd ../$1$1
}

tmuxc() {
    tmux new-session -c "$HOME/Sandbox/$1" -s code -d -n nvim
    tmux split-window -hd -l 20% -t code:nvim.1 ''
    # tmux split-window -v -d -t code:nvim.1 top
    # tmux split-window -h -d -t code:1.2 top
    tmux attach -t code
}

# ==============================   CONVERT TO NVIM SPLIT x3
tmuxweb() {
    Z_TMUX_WEB=true
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

    dir="$HOME/Sandbox/JAVASCRIPT/$1"
    tmux new-session -c "$dir" -s web -d -n main nvim "js/main.js" "+rightbelow ${h}vsplit style.css" "+split index.html" "+1wincmd w"
    # tmux split-window -c "$dir" -hd -l 40% -t web:main.1
    # tmux split-window -c "$dir" -vd -l 50% -t web:main.2
    tmux attach -t web
}

# ==============================   WN
wn() {
    dir="/data/media"
    dirs=($dir/*)
    type="$1"
    content="$2"
    season="$3"
    episode="$4"

    yo() {
        if [[ -z ${(P)1} ]]; then
            c=0
            for i in $dirs; do
                ((c++))
                echo "[$c] ${i##*/}"
            done
            echo -n "Which $1: "
            read $1
            if [[ -z "${(P)1}" ]]; then
                echo "wn: ur ass picked nothing"
                return 1
            fi
        fi
        echo "${1} chosen: ${dirs[${(P)1}]##*/}"
        return 0
    }
nextdir() {
    dir="${dirs[${(P)1}]}"
    dirs=($dir/*)
    echo $dir
    eval ${1}=\"${dir##*/}\"
}
yo type
nextdir type
yo content
nextdir content
if [[ $type = movies ]]; then
    mpv $dir & disown; exit
fi
yo season
nextdir season
yo episode

vidpath="$dirs[$episode]"
profile="$content/$season"
profile_opt="--profile=$profile"
opts=("--terminal=no" "--input-ipc-server=/tmp/mpvscriptsocket")

case "$type" in
    "anime")
        if $(mpv --profile=help | grep -q $profile); then
            echo yup
            mpv $profile_opt $opts $vidpath & disown
            pidwait -n mpv
            echo hi | socat - /tmp/mpvscriptsocket
            exit
        else
            echo nop
            echo -e "\n[$profile]\nprofile=anime" >> ~/.config/mpv/profiles.conf
            mpv $profile_opt $opts $vidpath & disown
            sleep 0.3
            echo show-text \"Made a profile for $profile\" 5000 | socat - /tmp/mpvscriptsocket
            exit
        fi
        ;;
    *)
        echo tf is that
        ;;
esac
}
