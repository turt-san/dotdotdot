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
    echo {{$i}}:
    ls -1 "./$i"
    echo
    cfgDir="$HOME/.config/$i"
    if [[ -d "$cfgDir" ]]; then
        echo "$cfgDir already exists, deleting..."
        continue
    fi
    rm -rf "$cfgDir"
    ln -s "$PWD/$i" "$HOME/.config/$i"
done

if [[ ! -f "$HOME/.zshrc" ]]; then
    cp "./zsh/.zshrc" "$HOME/"
fi
