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
brewfile_source="$PWD/$BREWFILE"
brewfile_target_dir="$HOME/.config/brewfile"
brewfile_target="$brewfile_target_dir/Brewfile"

rm -f $brewfile_target
mkdir -p $brewfile_target_dir
ln -s $brewfile_source $brewfile_target

for file in $DOTFILES; do
  destination=$HOME/`basename $file`
  rm -rf $destination
  ln -s $file $destination
done

exit 0
