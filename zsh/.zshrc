# zshrc
#

export ZHOME=/home/michael
export ZSH=$ZHOME/.oh-my-zsh

fpath+=${ZDOTDIR:-~}/.zsh_functions

setopt +o nomatch

ZSH_DISABLE_COMPFIX=true
ZSH_THEME="custom"

plugins=(git git-extras screen sudo history zsh-completions docker docker-compose firewalld)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh
source $ZHOME/.zprofile
source $ZHOME/.zlocal

# User configuration
export LANG=en_GB.UTF-8
export EDITOR='nvim'
export BROWSER='~/.bin/firefox'
export MAKEFLAGS="-j24"
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-/run/user/$(id -u)}
#export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock

TIMEFMT=$'real\t%E\nuser\t%U\nsys\t%S'
#TIMEFMT=$'%J\n%U user\n%S system\n%P cpu\n%*E total'

unset SSH_ASKPASS
unsetopt complete_aliases

alias fucking='sudo'
alias rm='safe-rm'
alias vim='nvim'
alias wget='wget -4 $@'
alias pwsh='TERM=xterm pwsh'
alias getclass="xprop WM_CLASS WM_NAME"
alias getid="sleep 2 && swaymsg -t get_tree | jq -r '..|try select(.focused == true)'"
alias setborder="sleep 2 && swaymsg border normal"
alias setnoborder="sleep 2 && swaymsg border none"
alias lsdd="lsof -P -T -p $@"
alias musikcube="TERM=xterm musikcube"
#alias docker="podman"

# rust utils
alias ls="exa $@ --git"
alias l="ls -alh"
alias ll="ls -algh"
#alias cat="bat"
alias du="dust"
alias tmux="zellij"
alias grep="rg"

alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias zshrc="$EDITOR ~/.zshrc && source ~/.zshrc"
alias youtube-dl="youtube-dl --proxy=socks5://10.0.20.6:1080/ $@"

compdef lsdd="lsof"

manpdf() {
    man -t $1 | ps2pdf - /tmp/$1.pdf
    evince /tmp/$1.pdf &
}

susu() { sudo su -p -s /bin/zsh }
mcsh() { machinectl shell .host /bin/zsh }

mpv-yt() { mpv --ytdl-raw-options=proxy=[socks5://10.0.25.1:1080] $@ }
ssh-yubi() { ssh-keygen -D /usr/lib64/libykcs11.so.1 -e }

cdxyz() { cd ~/go/src/git.0cd.xyz/0cd.xyz/0cd.xyz-go }
cdgo () { cd ~/go/src/git.0cd.xyz/$@ }
cdpico() { cd ~/pico }
cdrs() { cd ~/Documents/Development/rust }

# docker commands
dps() { docker ps $@ --format="table {{.ID}}\\t{{.Image}}\\t{{.Command}}\\t{{.Status}}" }
drmi() { docker rmi $(docker images -f dangling=true --format={{.ID}}) }
drmc() { docker rm $(docker container ls --filter=status=exited --format={{.ID}}) }
dcnuke() {
    podman unmount $(podman ps --external --format={{.ID}})
    podman rm $(podman ps --external --format={{.ID}})
}

viewcert() {
    echo | openssl s_client -servername $1 -connect $1:443 2>/dev/null | openssl x509 -text
}

blockdump() {
    echo "Cert:\n"
    echo | openssl s_client -servername $1 -connect $1:443 2>/dev/null | openssl x509 -text
    echo "\n\nDig:\n"
    dig $1
    echo "\n\ncurl results for http:\n"
    curl -k http://$1
    echo "\n\ncurl for https:\n"
    curl -k https://$1
    echo "\nwhois for site:\n"
    whois -H $1
    IP="(\n\nwhois for IP ($IP)\n"
    whois -H $IP
}

ip-origin() { curl http://api.db-ip.com/v2/free/$1 }
mac-address() { sed 's/:/-/g' <<< $@; }
#check_dir() { du -kxcsh *; ls -1 * | wc -l; }
check_dir() { et --level 1 --sort size --ignore-git-ignore }

autoload -U +X bashcompinit && bashcompinit
