#!/bin/bash
IFS=""

if ! [[ -d $HOME/.config ]]; then
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

CONFS=("nvim" "alacritty" "zsh")
for i in ${CONFS[@]}; do
    echo {{$i}}
    ls "./$i"
    ln -s "$PWD/$i" "$HOME/.config/$i"
done
echo "source ./.config/zsh/main.zsh" >> "$HOME/.zshrc"
