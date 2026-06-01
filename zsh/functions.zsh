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

go() {
    cd ../$1
}

autoload -U compinit
compinit
compdef '_files -g "*.log"' '-redirect-,2>,-default-'
# compdef '_files -g "*.log"' cd

alias ...="cd ../.."
alias ....="cd ../../.."


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
#
