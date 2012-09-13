# ~/.bash_aliases, instead of adding them here directly.
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi
# some more ls aliases
alias ls='ls --color=auto'
alias ll='ls -lh'
alias lal='ls -lah'
alias duh='du -h'					# because i kept typing duh instead of du -h
alias gerp="egrep --exclude=\*.svn\* --exclude=\*.git\* -r -n"
alias records='uprecords'
alias bhg='cat $HISTFILE| grep'
alias i-can-haz='apt-get install'
alias git='~/bin/git-achievements'
alias diff="/usr/bin/diff -y"				# diff preference
alias ack-grep-less="/usr/bin/ack-grep --pager='/usr/bin/less -r'"
alias getComposer='curl -s http://getcomposer.org/installer | php'
alias alex="/usr/bin/axel -a"
alias ifconfig.me="curl ifconfig.me"

if [ -f '~/.svn_aliases' ]; then
  . ~/.svn_aliases
fi
