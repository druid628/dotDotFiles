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
alias ack-grep-less="/usr/bin/ack-grep --pager="/usr/bin/less -r"
alias getComposer='curl -s http://getcomposer.org/installer | php'
alias alex="/usr/bin/axel -a"

# SVN options
alias getNew="svn st |grep ? | cut -d ' ' -f 8"		# gets New files not under svn's control
alias getMods="svn st |grep '^M' | cut -d ' ' -f 8"	# gets modified only files under svn's control
alias getAdds="svn st |grep '^A' | cut -d ' ' -f 8"	# gets only files which have been added to svn's control and have yet to be committed
alias 2BC="svn st |egrep '^A|^M' | cut -d ' ' -f 8"	# 2 Be Committed - only files which have been modified or added & are awaiting to be committed
alias hideNew="svn st |sed '/?/d' | cut -d ' ' -f 8"	# give me everything  (including external repos) except new unrevisioned files
# alias fixCache='sudo chown -R micah:micah cache/ log/ web/'   # just something used occasionally - cannot rem why it was created
