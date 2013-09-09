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

export EDITOR='emacs -nw --color=never'
