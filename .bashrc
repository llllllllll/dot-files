# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# TODO: Rice this.
PS1='[\u@\h \W]\$ '

if [ -f $HOME/.bash_aliases ]
then
  . $HOME/.bash_aliases
fi

source /usr/share/doc/pkgfile/command-not-found.bash
source /usr/bin/virtualenvwrapper.sh
source ~/.profile

export TERM=xterm-256color
export EDITOR='emacs -nw'
export BROWSER=firefox

# Add my shit here mang.
export PATH=$HOME/bin:$HOME/.cabal/bin:$HOME/.rvm/bin:$HOME/.rvm/rubies/ruby-2.0.0-p481/bin:$HOME/.rvm/gems/ruby-2.0.0-p481@global/bin:$HOME/.rvm/gems/ruby-2.0.0-p481/bin:$PATH


# Python nose complete
# copied from newer versions of bash
__ltrim_colon_completions() {
    # If word-to-complete contains a colon,
    # and bash-version < 4,
    # or bash-version >= 4 and COMP_WORDBREAKS contains a colon
    if [[
        "$1" == *:* && (
            ${BASH_VERSINFO[0]} -lt 4 ||
            (${BASH_VERSINFO[0]} -ge 4 && "$COMP_WORDBREAKS" == *:*)
        )
    ]]; then
        # Remove colon-word prefix from COMPREPLY items
        local colon_word=${1%${1##*:}}
        local i=${#COMPREPLY[*]}
        while [ $((--i)) -ge 0 ]; do
            COMPREPLY[$i]=${COMPREPLY[$i]#"$colon_word"}
        done
    fi
} # __ltrim_colon_completions()

_nosetests()
{
    cur=${COMP_WORDS[COMP_CWORD]}
    if [[
            ${BASH_VERSINFO[0]} -lt 4 ||
            (${BASH_VERSINFO[0]} -ge 4 && "$COMP_WORDBREAKS" == *:*)
    ]]; then
        local i=$COMP_CWORD
        while [ $i -ge 0 ]; do
            [ "${COMP_WORDS[$((i--))]}" == ":" ] && break
        done
        if [ $i -gt 0 ]; then
            cur=$(printf "%s" ${COMP_WORDS[@]:$i})
        fi
    fi
    COMPREPLY=(`nosecomplete ${cur} 2>/dev/null`)
    __ltrim_colon_completions "$cur"
}
complete -o nospace -F _nosetests nosetests


docker-clean(){
    docker ps -aq | xargs docker rm "$@"
}

docker-clean-images(){
    docker images | grep \<none\> | tr -s ' ' | cut -d' ' -f3 | xargs docker rmi "$@"
}
