#!/bin/bash
DOTFILESDIR=`pwd`
DOTSKELDIR=$DOTFILESDIR/skel
DOTGITDIR=$DOTFILESDIR/git
ECHO=`which echo`
GIT=`which git`
. skel/DOT.colors
. skel/DOT.bash_signature

$ECHO -e "${BLUE}[dotDotFiles]${NC} Updating dot files repo."
$GIT pull -q
# skel files
$ECHO -e "${BLUE}[dotDotFiles]${NC} Adding new dot files."
cd $DOTSKELDIR
for f in $(ls DOT.*)
do
  NEWFILENAME=`echo $f | sed 's/DOT//'`
  if [ ! -e $HOME/$NEWFILENAME ]; then
     $ECHO -e "${GREEN}Adding ${LIGHT_GREEN}${NEWFILENAME}${NC}."
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
     $ECHO -e "${GREEN}Adding ${LIGHT_GREEN}${NEWFILENAME}${NC}."
      cp $DOTGITDIR/$f $HOME/$NEWFILENAME
  fi
done

# move back to dotDotFiles
cd $DOTFILESDIR

$ECHO -e "${BLUE}[dotDotFiles]${NC} ${PURPLE}Checking for bin folder.${NC}"
cd $HOME
# bin dir
if [ -d $HOME/bin ]; then
   $ECHO -e "${BLUE}[dotDotFiles]${NC} ${RED_BOLD}Copy and update your bin/ files as needed.${NC}"
else
   ln -s $DOTFILESDIR/bin $HOME/bin
fi

$ECHO -e "${BLUE}[dotDotFiles]${NC} ${PURPLE}Checking for .vim folder.${NC}"
# .vim dir
if [ -d $HOME/.vim ]; then
   $ECHO -e "${BLUE}[dotDotFiles]${NC} ${RED_BOLD}You will need to update your .vim folder manually.${NC}"
else
   ln -s $DOTFILESDIR/vim $HOME/.vim
fi
