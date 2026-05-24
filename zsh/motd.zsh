local red='\033[4;31m'
local reset='\033[0m'
local white='\033[1;4;33m'
local sred='\x1b[38;2;255;0;0m'
local syellow='\x1b[38;2;255;255;0m'
local underscore='\033[4m'
echo "hi, today is ${sred}Week $(date +'%V')${reset}"
echo -n "$syellow"
if [[ -f ~/motd.md ]]; then
    cat ~/motd.md
fi
