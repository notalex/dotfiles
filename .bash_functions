#! /usr/bin/env bash

automux_installed() {
  gem list | grep automux 1> /dev/null
}

add_to_path() {
 [[ $PATH != *$1* ]] && PATH=$PATH:$1
}

# git
gaf() {
  git add -f $@

  printf '\033[0;34m'
  echo '              ***###***'
  printf '\033[0m'

  git status
  git diff --cached
}

gcm() {
  git commit -m "$(echo $@)"
}

# misc
dump-development-db() {
  if [ $1 ]; then
    db_path=$1
  else
    db_path=$HOME/gitbasket/db/$(development-db-name).sql
  fi

  pg_dump $(development-db-name) > $db_path
}

load-development-db() {
  if [ $1 ]; then
    db_path=$1
  else
    db_path=~/gitbasket/db/$(development-db-name).sql
  fi

  rake db:drop RAILS_ENV=development; rake db:create; psql $(development-db-name) < $db_path
}

rr() {
  if [ $@ ]; then
    rake routes CONTROLLER=$@
  else
    rake routes
  fi
}

on-vagrant() {
  [ $HOME == '/home/vagrant' ] && echo true
}

on-docker() {
  [ $HOME == '/home/docker' ] && echo true
}

g-set-upstream() {
  git branch --set-upstream $1 origin/$1
}

brk() {
  sleep $@; notify-send -u critical 'Break!!'
}

on-mac() {
  [[ $(uname) == 'Darwin' ]] && echo true
}

# git
g-clone() { git clone git://github.com/$1.git; }
g-author() { git commit --amend --reset-author; }
