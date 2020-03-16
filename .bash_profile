#
# ~/.bash_profile
#

source ~/.profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

docker-clean() {
    docker ps -aq | xargs docker rm "$@"
}

docker-clean-images() {
    docker images | grep \<none\> | tr -s ' ' | cut -d' ' -f3 | xargs docker rmi "$@"
}
