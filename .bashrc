#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

if [ -f $HOME/.bash_aliases ]
then
  . $HOME/.bash_aliases
fi

source /usr/share/doc/pkgfile/command-not-found.bash

TERM=xterm-256color

export EDITOR='emacs -nw'
