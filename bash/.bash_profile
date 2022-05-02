# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

EDITOR="vim"
export QPA_PLATFORM_THEME=qt5ct

if [ $(hostname --short) == "fedora" ]; then
    GOPATH=$HOME/go
    CPATH=$HOME/.local/C
    CPPATH=$HOME/.local/cpp
    PATH=$PATH:~/.local/bin:$GOPATH/bin:$CPATH/bin:$CPPATH/bin:~/bin
    export PATH
fi

export PATH="$HOME/.cargo/bin:$PATH"
if [ -e /home/michael/.nix-profile/etc/profile.d/nix.sh ]; then . /home/michael/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
