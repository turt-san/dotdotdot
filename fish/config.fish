source /usr/share/cachyos-fish-config/cachyos-config.fish

set -x MANPAGER 'nvim +Man!'

function fish_greeting
    sleepy
end

# git
set -g __fish_git_prompt_showdirtystate true

set logo_path /home/turt/.config/fish/cachyos_logo.txt

function mkcdir -a dir
    mkdir "$dir" && cd "$dir"
end

function chars
    set chs '┌─╰━┗┏█┃●'
    set chs (echo $chs | grep -o '.')
    string join -- \n $chs
end

function sleepy
    printf '\n\n'

    for i in (seq 22)
        set step (math "255/22")

        set r (math "$i * $step")
        set g '0'
        set b '255'
        set color (rgb $r $g $b)
        set result (cat $logo_path | head -$i | tail -1)
        printf '%s\n' (set_color $color)$result(set_color --reset)
        sleep 0.01
    end

    printf '\n\n'
end

function rgb -a r g b
    set r1 (math -b hex "$r / 16")
    set r2 (math -b hex "$r % 16")
    set g1 (math -b hex "$g / 16")
    set g2 (math -b hex "$g % 16")
    set b1 (math -b hex "$b / 16")
    set b2 (math -b hex "$b % 16")
    string join '' $r1 $r2 $g1 $g2 $b1 $b2 | sed 's/0x//g'
end

function sum
    for i in $argv
        set sum (math "$sum + $i")
    end
    echo $sum
end

set top_left '┏'
set bottom_left '┗'
set connector '━'

function fish_prompt
    set color1 'eddb16'
    set color2 '9d0000'

    #_c is for colored versions
    set terminal_size (stty size | grep -Po ' \K.*')
    set terminal_size_c (set_color 351)$terminal_size(set_color --reset)

    set time_ms (echo $CMD_DURATION | grep -Po '.{1,3}$')'ms'

    if test [[ $CMD_DURATION >= 1000 ]]
        set time_s (echo $CMD_DURATION | grep -Po '.+(?=.{3})')'s'
    end

    set time '[ '(string join -n ' ' $time_s $time_ms)' ]'
    set time_c (set_color -f $color1 -b $color2)$time(set_color --reset)

    set info (string join '' $time_c)

    # Line Maker 9000
    set sum (sum (string length -V $info))

    set sum (math --scale 0 -m round "($terminal_size - $sum) * 0.5 - 5")
    for i in (seq $sum)
        # set r (math "255 / $sum * $i")
        # set g '0'
        # set b '255'
        # set color (rgb $r $g $b)
        set line (string join '' (set_color $color2)$connector(set_color --reset) $line)
    end

    set pre_line (set_color $color2)"$top_left$connector"(set_color --reset)
    set pre_info (set_color $color2)'▌: '(set_color --reset)
    set pre_where (set_color $color2)"$bottom_left$connector"(set_color --reset)
    set where (set_color -b $color2 -f $color1)" $(prompt_pwd --dir-length 0)$(fish_git_prompt) "(set_color --reset)
    set post_where (set_color -b $color2 -f $color1)'❯'(set_color --reset)(set_color $color2)' '(set_color --reset)

    printf '%s%s%s%s\n' $pre_line $line $pre_info $info

    printf '%s\n' (set_color $color2)'┃'(set_color --reset)

    printf '%s%s%s' $pre_where $where $post_where
end

alias grepp='grep -P'
alias r='exec "$SHELL"'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# set -x PAGER 'nvim'

# function printtime --on-event fish_postexec
#     echo $CMD_DURATION
# end

# fish_add_path /home/turt/.dotnet/tools/
