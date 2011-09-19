# -*- shell-script -*-
# mkcd: a script which declares a function, mkcd.
# Time-stamp: <2002-09-03 13:27:08 root mkcd>
# mkcd creates a directory hierarchy, then cds into it all in one
# swell foop. To use it in your shell, run it as:
# . /path/mkcd
# That will execute it without launching a new shell, so that it
# changes your current shell's environment.
# You can then use the function in scripts or from the terminal to
# create a new directory or directory hierarchy, and cd into it. E.g:
#
# mkcd foo/bar/baz

function mkcd
{
dir=$1;
mkdir -p $dir && cd $dir;
}
# -*- shell-script -*-
# lowercase: a script which declares a function, lowercase.
# Timestamp: <2007-04-13 ??:??:?? druid lowercase>
# lowercase accepts any number of commandline arguments and
# converts them all to lowercase
# . /path/lowercase
# That will execute it without launching a new shell, so that it
# changes your current shell's environment.
# You can then use the function in scripts or from the terminal to
# convert text to all lowercase. E.g:
#
# $ lowercase Eggs Benedict
# eggs benedict

function lowercase
{
echo $@ |tr '[:upper:]' '[:lower:]'
}


function pathadd() 
{
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
            PATH="$PATH:$1"
    fi
}
