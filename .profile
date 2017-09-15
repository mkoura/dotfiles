# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

pathmunge() {
  [ -d "$1" ] || return 1
  case "${PATH}" in
    *:${1}:*|${1}:*|*:${1}|${1}) ;;
    *)
      if [ "$2" = "after" ]; then
        PATH=${PATH}:$1
      else
        PATH=${1}:$PATH
      fi ;;
  esac
  return 0
}

# locale settings
export LC_MESSAGES=en_US.UTF-8
export LANG=cs_CZ.UTF-8

# set PATH so it includes user's node_modules/bin if it exists
# (execute "ln -s .bin ~/node_modules/bin" first)
pathmunge "$HOME/node_modules/bin"

# set PATH so it includes user's $GOPATH if it exists
pathmunge "$HOME/.local/gopath/bin" && export GOPATH=$HOME/.local/gopath

# set PATH so it includes user's .local/bin if it exists
pathmunge "$HOME/.local/bin"

# set PATH so it includes user's private bin if it exists
pathmunge "$HOME/bin"

export PATH

# bug in Qt5 activate high dpi
export QT_SCALE_FACTOR=1

# fix ugly fonts in java swing
# https://wiki.archlinux.org/index.php/Java_Runtime_Environment_fonts
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"

# Midnight Commander skin
export MC_SKIN=/usr/share/mc/skins/modarin256-defbg.ini

# run here as it's needed for both shell and X sessions
hash tmpcache.sh 2>/dev/null && tmpcache.sh

unset -f pathmunge

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

