#!/bin/bash
if [ -z "$1" ] || [ "${1}" = "--no-io" ]; then
  IO="NO"
else
  IO="YES"
fi

echo "Setting up Bash the way you like it (Part 1)"
cd skel

for f in $(ls DOT.*)
do
  NEWFILENAME=`echo $f | sed 's/DOT//'`
  echo $NEWFILENAME
  if [ -e $HOME/$NEWFILENAME ]; then
      mv $HOME/$NEWFILENAME $HOME/$NEWFILENAME.bak
  fi
  ln -s `pwd`/$f $HOME/$NEWFILENAME
done

# move back to dotDotFiles
cd ../

# bin dir
if [ -d $HOME/bin ]; then
   echo "Copy and update your bin/ files as needed."
else
   ln -s bin $HOME/bin
fi

# .vim dir
if [ -d $HOME/.vim ]; then
   echo "update your .vim folder"
else
   ln -s vim $HOME/.vim
fi

#  if [ $IO == "YES" ]; then
#     if [ -z $1 ] || [ $1 != "--no-io" ]; then
#       echo "Performing git Magic-ness"
#       git submodule update --init --recursive
#       cd ../
#       echo "Setting up Bash the way you like it: The sequel" 
#       cp ioBashExtras $HOME
#       cd $HOME/ioBashExtras
#       ./install.sh $HOME/.bashrc
#     fi
#  fi
