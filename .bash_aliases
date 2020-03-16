# Utils
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias log-out='sudo pkill -u -KILL joe'
alias bash_aliases='$EDITOR ~/.bash_aliases'
alias build_ext='time python setup.py build_ext --inplace'
alias qipython='ipython --profile=`basename "$VIRTUAL_ENV"`'
alias work-monitor='xrandr --output HDMI2 --auto --left-of eDP1 --output DP1 --left-of HDMI2 --auto --rotate right'
alias single-monitor='xrandr --output HDMI2 --off --output DP1 --off --output eDP1 --auto'

# kona with readline
alias k='rlwrap k'

# p-please run my command.
alias please='sudo $(history -p !!)'

alias noge='nosetests --gevented-process=0'
complete -o nospace -F _nosetests noge