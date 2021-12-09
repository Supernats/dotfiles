#!/bin/bash

BREWFILE=${BREWFILE:-Brewfile.minimal}
DIR=$(cd $(dirname $0) && pwd -P)
EXCLUDE_STRING=`cat nonlinkers.txt | sed -e "s/\(.*\)/-not -name \1/" | tr "\n" " "`

if [ ! -e $PWD/$BREWFILE ];
then
  echo "Brewfile does not exist. Aborting."
  exit 1
fi

DOTFILES=`find $DIR \
  $EXCLUDE_STRING \
  -mindepth 1 \
  -maxdepth 1 \
  2>/dev/null`

# Handle Brewfile separately
brewfile_source=$PWD/$BREWFILE
brewfile_target=$HOME/`basename Brewfile`

rm -f $brewfile_target
ln -s $brewile_source $brewfile_target

for file in $DOTFILES; do
  destination=$HOME/`basename $file`
  rm -rf $destination
  ln -s $file $destination
done
exit 0
