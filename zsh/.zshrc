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

source <(kubectl completion zsh)
source <(k3d completion zsh)

source $ZSH/oh-my-zsh.sh
source $ZHOME/.zprofile
source $ZHOME/.zlocal

#eval "$(ssh-agent -s)"

# User configuration
export LANG=en_GB.UTF-8
export EDITOR='nvim'
export BROWSER='~/.local/bin/firefox'
export MAKEFLAGS="-j16"
export GOPRIVATE=$(cat $HOME/.goprivate)
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-/run/user/$(id -u)}
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock

TIMEFMT=$'real\t%E\nuser\t%U\nsys\t%S'
#TIMEFMT=$'%J\n%U user\n%S system\n%P cpu\n%*E total'

unset SSH_ASKPASS
unsetopt complete_aliases

alias fucking='sudo'
alias ls='exa $@ --git'
alias l='ls -alh'
alias ll='ls -algh'
alias rm='safe-rm'
alias vim='nvim'
alias wget='wget -4 $@'
alias pwsh='TERM=xterm pwsh'
alias getclass="xprop WM_CLASS WM_NAME"
alias getid="sleep 2 && swaymsg -t get_tree | jq -r '..|try select(.focused == true)'"
alias setborder="sleep 2 && swaymsg border normal"
alias setnoborder="sleep 2 && swaymsg border none"
alias lsdd="lsof -P -T -p $@"
alias docker="podman"

alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias zshrc="$EDITOR ~/.zshrc && source ~/.zshrc"
alias youtube-dl="youtube-dl --proxy=socks5://10.0.25.1:1080/ $@"

# Nintendo Switch hacking
alias fusee-launcher="python3 $FUSEE/fusee-launcher.py"
alias fusee-boot="sudo python3 $FUSEE/fusee-launcher.py $HBDIR/hekate_ctcaer_5.0.2.bin"
export FUSEE=$ZHOME/git/switch/fusee-launcher
export HBDIR=/mnt/storage/Switch/homebrew/

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC

compdef lsdd="lsof"

export ANDROID_NDK_HOME=/opt/android-ndk-r20b

manpdf() {
    man -t $1 | ps2pdf - /tmp/$1.pdf
    evince /tmp/$1.pdf &
}

susu() { sudo su -p -s /bin/zsh }
mcsh() { machinectl shell .host /bin/zsh }

mpv-yt() { mpv --ytdl-raw-options=proxy=[socks5://10.0.25.1:1080] $@ }
ssh-yubi() { ssh-keygen -D /usr/lib64/libykcs11.so.1 -e }

cs() { cd /mnt/storage/Games/Nintendo/Switch; ls }
cdf() { cd ~/git/dotfiles }
cdxyz() { cd ~/go/src/git.0cd.xyz/0cd.xyz/0cd.xyz-go }
cdgo () { cd ~/go/src/git.0cd.xyz/$@ }
cdpico() { cd ~/pico }

# docker commands
dps() { docker ps $@ --format="table {{.ID}}\\t{{.Image}}\\t{{.Command}}\\t{{.Status}}" }
drmi() { docker rmi $(docker images -f dangling=true --format={{.ID}}) }
drmc() { docker rm $(docker container ls --filter=status=exited --format={{.ID}}) }

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

commands() {code -n ~/Documents/Development/documentation/commands.md }
ip-origin() { curl http://api.db-ip.com/v2/free/$1 }
mac-address() { sed 's/:/-/g' <<< $@; }
check_dir() { du -kxcsh *; ls -1 * | wc -l; }
lp_send() { lp -h 10.0.20.2:631 -d envy_5530 $@; }
vfio-check() {
    lspci -nnk -d 1002:67df
    lspci -nnk -d 1022:1457
    lspci -nnk -d 10ec:8168
    lspci -nnk -d 1022:43b9
}

autoload -U +X bashcompinit && bashcompinit