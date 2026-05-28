#!/bin/bash
CONFS=("nvim" "alacritty" "zsh" "waybar")
if [[ $# -ne 0 ]]; then
    CONFS=($@)
fi

if [[ ! -d $HOME/.config ]]; then
    echo -n "$HOME/.config does not exist, create it? y/n: "
    read ans
    pns=$(expr "$ans" : '^[yY]')
    if [[ $pns == 1 ]]; then
        echo "Creating directory $HOME/.config..."
        mkdir "$HOME/.config"
    else
        exit 1
    fi
fi

for i in ${CONFS[@]}; do
    cfgDir="$HOME/.config/$i"

    echo {{${i^^}}}:
    ls -1 "./$i"
    if [[ -d "$cfgDir" || -f "$cfgDir" ]]; then
        echo -e "$cfgDir already exists, deleting...\n"
        rm -rf "$cfgDir"
    fi

    ln -v -s "$PWD/$i" "$HOME/.config/$i"
done

if [[ ! -f "$HOME/.zshrc" ]]; then
    cp "./zsh/.zshrc" "$HOME/"
fi
if [[ ! -f "$HOME/.tmux.conf" ]]; then
    cp "./tmux/.tmux.conf" "$HOME/"
fi
