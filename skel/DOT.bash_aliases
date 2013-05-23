# ~/.bash_aliases
# Generic non-system-specific should be able to use most everywhere aliases
# go here
#
# System specific ones go in .local_aliases

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
fi
# some more ls aliases
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lh'
alias lal='ls -lah'
alias duh='du -h'					# because i kept typing duh instead of du -h
alias gerp="egrep --exclude=\*.git\* -r -n"
alias records='uprecords'
alias bhg='cat $HISTFILE| grep'
alias git='~/bin/git-achievements'
alias diff="/usr/bin/diff -y"				# diff preference
alias getComposer='curl -s http://getcomposer.org/installer | php'
alias ifconfig.me="curl ifconfig.me"
alias zulu='date -u "+%d%b%Y-%H%Mz"'
alias now='date "+%d%b%Y-%H%M"'

# ack-grep-less
if [ -f '/usr/bin/ack-grep' ]; then
  alias ack-grep-less="/usr/bin/ack-grep --pager='/usr/bin/less -r'"
fi

# if using git-achivements... alias git to use it
if [ -f '~/bin/git-achievements' ]; then
  alias git='~/bin/git-achievements'
fi

# if axel is on the box typo-proof it
if [ -f '/usr/bin/axel' ]; then
  alias alex="/usr/bin/axel -a"
fi

# for the lulz
if [ -f $HOME/.lolcatz_aliases ]; then
  . ~/.lolcatz_aliases
fi

# SVN. ugh. 
if [ -f '~/.svn_aliases' ]; then
  . ~/.svn_aliases
fi

# anything specific to the local box
if [ -f $HOME/.local_aliases ]; then
  . ~/.local_aliases
fi

