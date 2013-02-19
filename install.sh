#!/bin/bash
ECHO=`which echo`
. skel/DOT.colors
$ECHO -e "${BLUE}[dotDotFiles]${NC} Setting up Bash the way you like it."
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
   $ECHO -e "${BLUE}[dotDotFiles]${NC} Copy and update your bin/ files as needed."
else
   ln -s dotDotFiles/bin $HOME/bin
fi

# .vim dir
if [ -d $HOME/.vim ]; then
   $ECHO -e "${BLUE}[dotDotFiles]${NC} Update your .vim folder"
else
   ln -s dotDotFiles/vim $HOME/.vim
fi

# update gitconfig
$ECHO -e "${BLUE}[dotDotFiles]${NC} ${RED_BOLD}Configure gitconfig?${NC} (y/n):"
read REPLY
if [ $REPLY == "y" ]; then
    echo "Gimme your email address:"
    read EMAIL
    sed -i "s/druid628\@gmail\.com/$EMAIL/" $HOME/.gitconfig
    $ECHO -e "${GREEN_BOLD}[Success] .gitconfig hath been updated.${NC}"
fi
