#!/bin/bash
confs=("nvim" "alacritty" "zsh" "waybar")
if [[ $# -ne 0 ]]; then
    confs=($@)
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

for i in ${confs[@]}; do
    cfgDir="$HOME/.config/$i"

    echo {{${i^^}}}:
    # ls -1 "./$i"
    if [[ -d "$cfgDir" || -f "$cfgDir" ]]; then
        echo -e "$cfgDir already exists, backing up...\n"
        mv -i "$cfgDir" "$cfgDir.old"
    fi

    # ln -v -s "$PWD/$i" "$HOME/.config/$i"
done

if [[ -f "$HOME/.zshrc" ]]; then
    echo "Warning: this file won't be used, due to .zshenv"
fi
if [[ -f "$HOME/.zshenv" ]]; then
    echo "Backing up .zshenv..."
    mv -v "$HOME/.zshenv" "$HOME/.zshenv.old"
fi
ln -v -s "$PWD/zsh/.zshenv" "$HOME/"

if [[ -f "$HOME/.tmux.conf" ]]; then
    echo "Backing up .tmux.conf..."
    mv -v "$HOME/.tmux.conf" "$HOME/.tmux.conf.old"
fi
ln -v -s "$PWD/tmux/.tmux.conf" "$HOME/"
