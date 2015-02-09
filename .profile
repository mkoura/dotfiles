# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# uncoment for colors in FreeBSD
#export CLICOLOR='yes'
#export TERM=xterm-color

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's node_modules/bin if it exists
# (execute "ln -s .bin ~/node_modules/bin" first)
if [ -d "$HOME/node_modules/bin" ] ; then
    PATH="$HOME/node_modules/bin:$PATH"
fi

# set PATH so it includes user's .local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
