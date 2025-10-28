#! /usr/bin/env bash

# ruby
heroku-push() { gps -r heroku $@ m; heroku run rake db:migrate; }

# bash
on-mac() { [[ $(uname) == 'Darwin' ]]; }
on-docker() { [ $HOME == '/home/docker' ] && echo true; }
on-vagrant() { [ $HOME == '/home/vagrant' ] && echo true; }
add_to_path() { [[ $PATH != *$1* ]] && PATH=$PATH:$1; }
prepend_to_path() { [[ $PATH != *$1* ]] && PATH=$1:$PATH; }
dpks() { cmd="dpkg --get-selections | grep $1"; echo $cmd; eval $cmd; }
pag() { cmd="ps aux | grep -i $1 | grep -v grep"; echo $cmd; eval $cmd; }
pagt() { cmd="ps auxf | grep -i $1 | grep -v grep"; echo $cmd; eval $cmd; }
pagm() { cmd="ps aux --sort -rss | less"; echo $cmd; eval $cmd; }
les() { $@ | less; }
hel() { $@ --help; }
xin() { $@ | xclip -selection clipboard; }
hss() { ssh $1@192.168.6.$2; }
vnc() { vncviewer 192.168.6.$1 ; }
rmt() { mv $1 ~/_trash; }
brk() { sleep $@; notify-send -u critical 'Break!!'; }
automux_installed() { gem list | grep automux 1> /dev/null; }
pskill() { ps aux | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9 ; }
aptversion() { apt-cache show $1 | grep Version: ; }
pd() { pushd $1 > /dev/null; }
fnd() { find $1 -iname "*$2*"; }
loc() { locate -b '\'$1; }

# git
gcm() { git commit -m "$(echo $@)"; }
gcmb() { git commit -m "$(~/.git_helpers/git_stats branch_name) $(echo $@)"; }
gcm-v() { git commit -m "$(echo $@)" --no-verify; }
ggrp() { cmd="git log --oneline --grep='$@'"; echo $cmd; eval $cmd; }
gstshow() { git stash show -p stash@{$1} $2; }
gstdrop() { git stash drop stash@{$1} $2; }
gstapply() { git stash apply stash@{$1} $2; }
grshn() { git reset --hard HEAD~$1; }
gcr() { git branch $1 origin/$1; }
g-clone() { git clone git://github.com/$1.git; }
g-author() { git commit --amend --reset-author; }
g-set-upstream() { git branch --set-upstream $1 origin/$1; }
gbc() { git remote update && git branch -f $1 origin/$1; git checkout $1; }

gaf() {
  git add -f $@

  printf '\033[0;34m'
  echo '              ***###***'
  printf '\033[0m'

  git status
  git diff --cached
}

# misc

wat() { eval "watch -x -n 5 bash -ic '"$@"'"; }

mma() { automux medium -asr ~/projects/$1 -n $1; }

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

vga-connect() {
  if [[ $1 == 'r' ]]; then
    direction='right'
  else
    direction='left'
  fi

  xrandr --output HDMI1 --off; xrandr --output VGA1 --auto --$direction-of eDP1; xmodmap ~/.Xmodmap
}

asd() {
  if [[ $1 == 'c' ]]; then
    asdf current
  elif [[ $1 == 'sr' ]]; then
    asdf shell ruby $2
  fi
}

rr() {
  if [ $@ ]; then
    bundle exec rake routes CONTROLLER=$@
  else
    bundle exec rake routes
  fi
}

set-ruby-version() {
  if [ -e .ruby-version ]; then
    if rvm &> /dev/null && [ -e .ruby-gemset ]; then
      rvm use $(cat .ruby-version)@$(cat .ruby-gemset) 2> /dev/null
    else
      export RBENV_VERSION=$(cat .ruby-version)
    fi
  fi
}

if on-mac; then
  ntf() { $@; terminal-notifier-notify -message 'Process finished...'; tmux display-message 'Process finished...'; }
else
  ntf() { $@; notify-send -u critical "Process finished: $@"; }
fi

# kubernetes
## kpo oh|fs|oa|er
kpo() {
  declare -A mapp=( [oh]=openhub [fs]=fisbot [oa]=ohloh-analytics [er]=errbit [sc]=scan )
  namespace=${mapp[$1]}
  [ $namespace ] || namespace=$1
  kubectl get po -n $namespace | grep -v migration
}

## k-pod fs worker-3 bin_cmd # only 1st arg is mandatory.
k-pod() {
  declare -A mapp=( [oh]=openhub [fs]=fisbot [oa]=ohloh-analytics [er]=errbit [sc]=scan )
  namespace=${mapp[$1]}
  [ $namespace ] || namespace=$1
  pod_name_pattern=$2
  run_cmd=${3-bash}
  pod_name=$(kubectl get po -n $namespace | grep "$pod_name_pattern" | grep -v '^NAME' | head -1 | cut -d ' ' -f -1)
  kubectl exec -ti -n $namespace $pod_name -- /bin/$run_cmd
}

k-context() {
  stg_name=$(cat ~/.config/private/oh-stg-context)
  stg_sc_name=$(cat ~/.config/private/sc-stg-context)
  prd_sc_name=$(cat ~/.config/private/sc-prd-context)
  if [ $1 == 'p' ]; then
    prd_name=$(echo $stg_name | sed 's/stg/prd/g')
    kubectl config use-context $prd_name
  elif [ $1 == 'sc' ]; then
    kubectl config use-context $stg_sc_name
  elif [ $1 == 'scp' ]; then
    kubectl config use-context $prd_sc_name
  else
    kubectl config use-context $stg_name
  fi
}

k-del-pod() {
  pod_name=$(kubectl get po -n $1 | grep "$2" | head -2 | tail -1 | cut -d ' ' -f -1)
  kubectl delete pod -n $1 $pod_name
}

rc-match() { recordmydesktop --windowid=$(xdotool search --name "$1" | tail -1) --no-sound; }

ntfs() { $@; mplayer ~/tones/notify-tone.mp3 1> /dev/null; notify-send -t 3000 "Process finished: $@"; }

d-rmc() { c_ids="$(docket ps -a | awk '{print $1}' | tail -n+2)"; docket stop $c_ids && docket rm $c_ids; }
d-rmc-l() { c_id="$(docket ps -a | awk '{print $1}' | head -2 | tail -1)"; docket stop $c_id && docket rm $c_id; }
d-st-l() { c_id="$(docket ps -a | awk '{print $1}' | head -2 | tail -1)"; docket start $c_id; }
d-exec-l() { c_id="$(docket ps -a | awk '{print $1}' | head -2 | tail -1)"; docket exec -it $c_id /bin/bash ; }
