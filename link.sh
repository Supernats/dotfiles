#!/bin/bash

DIR=$(cd $(dirname $0) && pwd -P)
EXCLUDE_STRING=`cat nonlinkers.txt | sed -e "s/\(.*\)/-not -name \1/" | tr "\n" " "`

DOTFILES=`find $DIR \
  $EXCLUDE_STRING \
  -mindepth 1 \
  -maxdepth 1 \
  2>/dev/null`

for file in $DOTFILES; do
  destination=$HOME/`basename $file`
  rm -rf $destination
  ln -s $file $destination
done
