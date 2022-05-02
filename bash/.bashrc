# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

#source /home/michael/.config/alacritty/alacritty-completions.bash

# alias commands
alias pwsh='TERM=xterm pwsh'

alias fucking='sudo'
alias ls='exa'
alias l='ls -alh'
alias ll='ls -algh'
alias rm='safe-rm'

unset SSH_ASKPASS

#if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . /usr/share/powerline/bash/powerline.sh
#fi

# commands
create_sha256sum() { find ./ -type f -print0 | xargs -0 sha256sum > /tmp/sha256sum; mv /tmp/sha256sum .; }
showdate() { date +"%Y-%m-%d %H:%M:%S"; }
watch_dd() { watch -n5 'sudo kill -USR1 $(pgrep ^dd)'; }
check_dir() { du -kxcsh *; ls -1 * | wc -l; }
mac-address() { sed 's/:/-/g' <<< $@; }
icanhaszip() { curl icanhazip.com; }
mem() { ps -eo rss,pid,euser,args:100 --sort %mem | grep -v grep | grep -i $@ | awk '{printf $1/1024 "MB"; $1=""; print }'; }
meminfo() { ps aux  | awk '{print $6/1024 " MB\t\t" $11}'  | sort -n; }

# dje4321 programs
#letter() { $applications/Dje4321/letter "$@" | xclip -selection c; }
#spoiler() { $applications/Dje4321/spoiler "$@" | xclip -selection c; }

# testing stuff
#who() { /usr/bin/who "$@" | sed '/pi/d'; }
#w() { /usr/bin/w "$@" | sed '/pi/d'; }
#last() { /usr/bin/last "$@" | sed '/pi/d'; }
#users() { if [[ -z $1 ]]; then echo "user"; else /usr/bin/users $1; fi }

#create_md5sum() { find ./ -type f -print0 | xargs -0 md5sum > checksum.md5; }
ssh_agent() { eval "$(ssh-agent -s)"; }
commands() { gedit ~/Documents/Development/Documentation/commands.md; }

export DEVKITPRO=/opt/devkitpro
export DEVKITA64=/opt/devkitpro/devkitA64
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC

endchar="\$"
if [ "$UID" = "0" ]; then
    endchar="#"
fi

FG="\[\033[38;5;050m\]"
BG="\[\033[38;5;245m\]"
AT="\[\033[38;5;245m\]"
HCOLOR="\[\033[38;5;32m\]"

PS1="${FG}\u${AT}@${HCOLOR}\h ${BG}\w ${FG}$endchar \[\e[0m\]"

unset FG
unset BG
unset AT
unset HCOLOE
shopt -s checkwinsize
source <(kubectl completion bash)

complete -C /home/michael/.local/bin/mc mc
