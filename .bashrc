# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# TODO: Rice this.
PS1='[\u \W]\$ '

if [ -f $HOME/.bash_aliases ]
then
  . $HOME/.bash_aliases
fi

ulimit -c unlimited

source /usr/share/doc/pkgfile/command-not-found.bash
source /usr/bin/virtualenvwrapper.sh
source ~/.profile

export TERM=rxvt-unicode-256color
export EDITOR='emacs -nw'
export BROWSER=firefox
export ATLAS=/usr/lib/libatlas.so
export BLAS=/usr/lib/libblas.so
export LAPACK=/usr/lib/liblapack.so

# Add my shit here mang.
export PATH=$HOME/bin:$HOME/.cabal/bin:$HOME/.rvm/bin:/opt/intel/vtune_amplifier_2019.2.0.588069/bin64/:$PATH

export LIBRARY_PATH=$HOME/lib:/usr/local/lib:/usr/local/dbg/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/lib:/usr/local/lib:/usr/local/dbg/lib:$LD_LIBRARY_PATH
export CPATH=$HOME/include:$CPATH
export CPLUS_INCLUDE_PATH=$HOME/include:$CPLUS_INCLUDE_PATH

export ASPROOT=$HOME/aur

INTEL_LICENSE_FILE=/opt/intel/licenses


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

function melt-eval(){
  touch __empty4melt.c;
  gcc -fplugin=melt -fplugin-arg-melt-mode=eval \
      -fplugin-arg-melt-arg="$*" -c __empty4melt.c -o /dev/null
  rm __empty4melt.c
}


function melt-repl(){
    touch __empty4melt.c
    gcc -fplugin=melt -fplugin-arg-melt-mode=repl -o /dev/null __empty4melt.c
    rm __empty4melt.c
}


function drop-test-mongo-dbs()
{
    mongo admin --eval 'db.getMongo().getDBNames().filter(function(name){return name.match("qexec_test_")}).forEach(function(name){db = db.getMongo().getDB(name); print(db); db.dropDatabase()})'
}


function mvvirtualenv() {
    cpvirtualenv $1 $2
    rmvirtualenv $1
    find $WORKON_HOME/$2 -exec sed -i s|$WORKON_HOME/$1|$WORKON_HOME/$2|g 2> /dev/null \;
    rm -rf ~/.ipython/profile_$1
}

complete -o default -o nospace -F _virtualenvs mvvirtualenv

complete -C /home/joe/projects/c++/h5s3/testbin/mc mc
