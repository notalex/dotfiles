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

dump-development-db() {
  pg_dump $(development-db-name) > ~/gitbasket/db/$(development-db-name).sql
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
