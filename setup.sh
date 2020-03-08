#!/usr/bin/env sh

set -eu


# Taken from https://github.com/vsbuffalo/dotfiles/blob/master/setup.sh
function linkdotfile {
  file="$1"
  if [ ! -e ~/$file -a ! -L ~/$file ]; then
    echo "$file not found, linking..." >&2
    ln -s ~/dotfiles/$file ~/$file
  else
    echo "$file found, ignoring..." >&2
  fi
}


linkdotfile .tmux.conf
linkdotfile .psqlrc
linkdotfile .Rprofile
