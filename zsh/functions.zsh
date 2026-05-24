mkcdir() {
    mkdir $1
    cd $1
}

# git add commit all
gaca() {
    git add .
    git commit --all --verbose --message "$*"
    git push
}
