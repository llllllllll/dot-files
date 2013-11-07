# Utils
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias log-out='sudo pkill -u -KILL joejev'
alias dotemacs='$EDITOR ~/.emacs'
alias bash_aliases='$EDITOR ~/.bash_aliases'
alias gmail='firefox mail.google.com'
alias lconnect='firefox https://lconnect.wit.edu/cp/home/displaylogin'
alias gh='firefox https://github.com/llllllllll/'


# School
alias vsc='g++ -pedantic -Wall'

# Humor
# p-please run my command.
alias please='sudo $(history -p !!)'

# Not mine.
unpack () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}
