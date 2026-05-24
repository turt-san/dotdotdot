#!/bin/bash
IFS=""

CONFS=("nvim" "alacritty" "zsh")
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
    if [[ -d "$HOME/.config/$i" ]]; then
        echo "$HOME/.config/$i already exists, skipping..."
        continue
    fi
    ln -s "$PWD/$i" "$HOME/.config/$i"
done

if [[ ! -f "$HOME/.zshrc" ]]; then
    echo "source ./.config/zsh/main.zsh" >> "$HOME/.zshrc"
fi
