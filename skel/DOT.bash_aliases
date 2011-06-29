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
alias gerp="egrep --exclude=\*.svn\* -r -n"
alias records='uprecords'
alias bhg='cat $HISTFILE| grep'
alias can-has='apt-get install'
alias git='~/bin/git-achievements'
    #alias la='ls -A'
    #alias l='ls -CF'
