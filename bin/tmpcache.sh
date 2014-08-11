#!/bin/sh

# nothing to do when config file does not exist
[ ! -e ~/.tmpcache ] && exit 0

# nothing to do if cache already exists
[ -e ~/.cache/.tmpcache ] && exit 0

# remove dangling symlink
rm -f ~/.cache/.tmpcache

# create cache dir
cachedir="$(mktemp -d /tmp/${LOGNAME:-$USER}-cache.XXXXXXX)"

# create link to cache dir in use
ln -s "$cachedir" ~/.cache/.tmpcache

# create symlink for each directory defined in config file
while read dir; do
  mkdir -p "${cachedir}/${dir}"
  rm -f ~/.cache/"$dir"
  ln -s "${cachedir}/${dir}" ~/.cache/"$dir"
done < ~/.tmpcache
