local red='\033[4;31m'
local reset='\033[0m'
local white='\033[1;4;33m'
local sred='\x1b[38;2;255;0;0m'
local syellow='\x1b[38;2;255;255;0m'
local underscore='\033[4m'
echo "hi, today is ${sred}Week $(date +'%V')${reset}"
echo -n "$syellow"
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

bindkey -A viins main

function run-editzshrc { nvim ~/.zshrc }
zle -N run-editzshrc

function run-editmpv { nvim ~/.config/mpv }
zle -N run-editmpv

function run-editnvim { nvim ~/.config/nvim/init.lua }
zle -N run-editnvim

bindkey "^F"  run-editzshrc
bindkey "^."  run-editzshrc
bindkey "^Xm" run-editmpv
bindkey "^Xn" run-editnvim

unsetopt correct_all

pyenvdir='~/Documents/pythonvenv/DEFAULT/'

# aliases
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
alias ssho='eval $(ssh-agent) ; ssh-add ~/.ssh/github-new'
alias blk='feh --fullscreen --hide-pointer ~/Images/Pictures/black.png &; disown; exit'
alias goodnight='shutdown -h +0'
# aliases

export SUDOEDITOR="nvim"
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

function hi {
    emulate -L zsh
    echo hi
    ls -la | tail -2
}

function wnl {
    local dir="/data/media"
    local dirs="$(command ls -1 $dir)"
    echo $dirs
}

function wn {
    fish -c wn; exit
}

# mf
animdir="/data/torrents/shows/Parasyte - The Maxim/"
function ren {
    emulate -L zsh
    for i in $(seq 1 24); do
        local new="$(echo $@[$i] | grep -Po '(.+)(?=.mkv)')"
        local old="$@[(( $i + 25 ))]"
        echo "Old: $old"
        echo "Moving $@[(( $i + 25 ))] to $new.srt"
        mv -v $old $new.srt
        echo "New: $new.srt"
    done
    echo "-1 is $@[-1]"
}

function reni {
    emulate -L zsh
    for i in $@; do
        echo $i
        local new="$(echo $i | grep -Po '(.+)(?=.srt)')".default.en.forced.srt
        echo $new
        sudo mv $i $new
    done
}

function remmm {
    emulate -L zsh
    for i in $@; do
        echo $i
        local new="$(echo $i | sed -z 's/\[.*] //')"
        echo $new
        sudo mv $i $new
    done
}

function split {
    local str=(${(@s:/:)animdir})
    echo $str
}

function lsls {
    emulate -LR zsh
    ls; ls
}

function lslsls {
    emulate -LR zsh
    ls;ls;ls
}

function lsls {
    emulate -LR zsh
    ls;ls;ls
}

# function wn -a type name season episode
#     if test -z $type
#         set c 0
#         for i in $dirs
#             set c (math "$c + 1")
#             echo "$i [$c]"
#         end
#
#         read -P "Which type: " type
#     end
#     if test -z $type
#         return 1
#     end
#     set aType $dirs[$type]
#     set dir $dir/$dirs[$type]
#     set dirs (command ls -1 $dir)
#     if test -z $name
#         set c 0
#         for i in $dirs
#             set c (math "$c + 1")
#             echo "$i [$c]"
#         end
#         read -P "Which $aType: " name
#     end
#     if test -z $name
#         return 1
#     end
#     set aName $dirs[$name]
#     set dir $dir/$dirs[$name]
#     if test $aType = movies
#         mpv $dir &; disown ; exit
#     end
#     set dirs (command ls -1 $dir)
#     if test -z $season
#         set c 0
#         for i in $dirs
#             set c (math "$c + 1")
#             echo "$i [$c]"
#         end
#         read -P "Which season: " season
#     end
#     if test -z $season
#         return 1
#     end
#     set aSeason $dirs[$season]
#     set dir $dir/$dirs[$season]
#     set dirs (command ls -1 $dir)
#     if test -z $episode
#         set c 0
#         for i in $dirs
#             set c (math "$c + 1")
#             echo "$i [$c]"
#         end
#         read -P "Which episode: " episode
#     end
#     if test -z $episode
#         return 1
#     end
#     set dir $dir/$dirs[$episode]
#     set cmd "$(command ls -1 $dir)"
#     set profile $aName/$aSeason
#     set profile_opt "--profile=$profile"
#     set opts --terminal=no --input-ipc-server=/tmp/mpvscriptsocket
#     switch $aType
#         case "anime"
#             if mpv --profile=help | grep -q $profile
#                 mpv $profile_opt $opts $cmd &; disown
#                 pidwait -n mpv
#                 echo hi | socat - /tmp/mpvscriptsocket
#             else
#                 echo \n[$profile]\nprofile=anime >> ~/.config/mpv/profiles.conf
#                 mpv $profile_opt $opts $cmd &; disown
#                 echo show-text \"Made a profile for $profile\" 5000 | socat - /tmp/mpvscriptsocket
#             end
#         case "movies"
#             mpv $cmd &; disown
#         case "shows"
#             mpv $cmd &; disown
#         case '*'
#             echo "$aType is not a type, aborting"
#             return 1
#     end
#     exit
# end

#activate then source python:
#python -m venv $pyenvdir
