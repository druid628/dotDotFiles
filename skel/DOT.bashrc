# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

BLACK="\[\e[0;38m\]"
RED="\[\e[31;1m\]";
RED_BOLD="\[\e[01;31m\]"
LIGHT_BLUE="\[\e[1;36m\]";
BLUE="\[\e[34;1m\]";
WHITE="\[\e[1;37m\]";
GREEN="\[\e[1;32m\]";
WHITE_ON_BLUE="\[\e[44;1;37m\]";
WHITE_ON_GREEN="\[\e[42;1;37m\]";
END_COLOR="\[\e[0m\]";

#GREEN="\[\033[0;32m\]"
#BLUE="\[\033[01;34m\]"


if [ "$color_prompt" = yes ]; then
    export PS1='[\[\e[34;1m\]\u\[\e[0m\]\[\e[1;37m\]@\[\e[0m\]\[\e[1;32m\]\h\[\e[0m\] \[\e[37;1m\]\W\[\e[0m\]\[\e[1;36m\]$(__git_ps1 " (%s)")\[\e[0m\]]\$'
else
    export PS1='${debian_chroot:+($debian_chroot)}[\u@\h:\w]\$ '
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_env ]; then
    . ~/.bash_env
fi


