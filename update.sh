#!/bin/bash
DOTFILESDIR=`pwd`
DOTSKELDIR=$DOTFILESDIR/skel
DOTGITDIR=$DOTFILESDIR/git
ECHO=`which echo`
GIT=`which git`
. skel/DOT.colors

$ECHO -e "${BLUE}[dotDotFiles]${NC} Updating dot files repo."
$GIT pull 
# skel files
$ECHO -e "${BLUE}[dotDotFiles]${NC} Adding new dot files."
cd $DOTSKELDIR
for f in $(ls DOT.*)
do
  NEWFILENAME=`echo $f | sed 's/DOT//'`
  if [ ! -e $HOME/$NEWFILENAME ]; then
     echo "Adding ${NEWFILENAME}."
     ln -s $DOTSKELDIR/$f $HOME/$NEWFILENAME
  fi
done

$ECHO -e "${BLUE}[dotDotFiles]${NC} Adding new git files."
# git components
cd $DOTGITDIR
for f in $(ls DOT.*)
do
  NEWFILENAME=`echo $f | sed 's/DOT//'`
  if [ ! -e $HOME/$NEWFILENAME ]; then
      cp $DOTGITDIR/$f $HOME/$NEWFILENAME
  fi
done

# move back to dotDotFiles
cd $DOTFILESDIR

$ECHO -e "${BLUE}[dotDotFiles]${NC} Checking for bin folder."
cd $HOME
# bin dir
if [ -d $HOME/bin ]; then
   $ECHO -e "${BLUE}[dotDotFiles]${NC} Copy and update your bin/ files as needed."
else
   ln -s $DOTFILESDIR/bin $HOME/bin
fi

$ECHO -e "${BLUE}[dotDotFiles]${NC} Checking for .vim folder."
# .vim dir
if [ -d $HOME/.vim ]; then
   $ECHO -e "${BLUE}[dotDotFiles]${NC} Update your .vim folder"
else
   ln -s $DOTFILESDIR/vim $HOME/.vim
fi
