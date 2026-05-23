bindkey -v
source cachyos-config.zsh
# Gutted in favor of former
#bindkey -A viins main

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
alias blk='feh -F ~/Images/Pictures/black.png &'
# aliases

export MANPAGER='nvim +Man!'
#export PAGER='nvim'
export EDITOR='nvim'
export SUDO_EDITOR='nvim'

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

function split {
    local str=(${(@s:/:)animdir})
    echo $str
}

function mkcdir {
    mkdir $1
    cd $1
}

# bindkey "^[[1;5C" forward-word
# bindkey "^[[1;5D" backward-word

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
