mkcdir() {
    mkdir $1
    cd $1
}

# ssh: OPEN
ssho() {
    eval $(ssh-agent)
    ssh-add "~/.ssh/keys/*"
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
