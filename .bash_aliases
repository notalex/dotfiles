# vim: set ft=sh:

# Heroku
alias h='heroku'
alias hr='heroku run'
alias h-tail='heroku logs --tail'
alias h-pg-info='heroku pg:info'
heroku-push() { gps -r heroku $@ m; heroku run rake db:migrate; }

# git
alias gar="git add -A"
alias gan="ge git add -N"
alias gcm="git commit -m"
alias gcma="git commit --amend"
alias gc-am="git commit -a -m"
alias grl="git reflog"
alias g-config="git config --list"
alias gra="git remote add"
alias gbv="git branch -v"
alias g-save="git stash; git stash apply"
alias gpl-src='git pull src master'
ggrp() { cmd="git log --oneline --grep='$@'"; echo $cmd; eval $cmd; }
gstshow() { git stash show -p stash@{$1} $2; }
gstapply() { git stash apply stash@{$1} $2; }
alias apl="pushd $HOME; git pull origin master; cd ~/gitbasket; git pull origin master; popd"
gcr() { git branch $1 origin/$1; }

# bash
alias s='sudo'
alias v='vagrant'
alias src='source ~/.bash_profile'
alias appa='sudo add-apt-repository'
alias apti='sudo apt-get install -y --force-yes'
alias aptr='sudo apt-get remove -y'
alias apts='sudo apt-cache search'
dpks() { cmd="dpkg --get-selections | grep $1"; echo $cmd; eval $cmd; }
pag() { cmd="ps aux | grep $1"; echo $cmd; eval $cmd; }
pagm() { cmd="ps aux --sort -rss | less"; echo $cmd; eval $cmd; }
les() { $@ | less; }
hel() { $@ --help; }
alias ccd='pushd > /dev/null'
alias pcd='popd > /dev/null'
alias speedtest="wget --output-document=/dev/null http://speedtest.sea01.softlayer.com/speedtest/speedtest/random1000x1000.jpg"
alias disk-usage="du -h --max-depth=1 $@"
xin() { $@ | xclip -selection clipboard; }
alias xout='xclip -o -selection clipboard'
hss() { ssh $1@192.168.6.$2; }
vnc() { vncviewer 192.168.6.$1 ; }
rmt() { mv $1 ~/.local/share/Trash; }
alias zzh='sudo pm-hibernate'

# gems
alias spc='spork cucumber'
alias cuke-spork='rake db:test:prepare && spork cucumber'
alias migrate-spork='rake db:migrate RAILS_ENV=test; spork cucumber'
alias reset-spork='rake db:reset RAILS_ENV=test; rake db:migrate RAILS_ENV=test; spork'
alias recreate-test-db='rake db:drop RAILS_ENV=test; rake db:create RAILS_ENV=test; rake db:migrate RAILS_ENV=test --trace;'
alias test-migrate='rake db:migrate RAILS_ENV=test --trace;'
alias redo-migrate-spork='rake db:migrate:redo RAILS_ENV=test; spork cucumber'
delayed-emails() { rake jobs:clear; rake jobs:work; }
alias cux='ntf cucumber --no-source -p run_all features/'
alias mnt='ruby -Itest test/'
alias mns='ntf ruby -Ispec spec/'
alias mnr='ntf rspec spec/'
alias cappy='cap production deploy; cap production-pinnacle deploy'
alias commonly-failing-tests-run='cucumber -p run_all features/suggest_participants.feature features/todo.feature features/snippet_rules.feature features/related_conversations.feature features/first_time_user.feature'
alias ikonverse-ssh-server='thin start --ssl --ssl-verify --ssl-key-file ~/Documents/ikonverse/\*.ikonverse-dev.com.key --ssl-cert-file ~/Documents/ikonverse/\*.ikonverse-dev.com.crt'
alias rjw='rake jobs:work'

# rails
alias rgm='rails generate migration'
alias rdm='rake db:migrate; rake db:migrate RAILS_ENV=test'
alias rd-migrate-redo='rake db:migrate:redo; rake db:migrate:redo RAILS_ENV=test'
alias rd-rollback='rake db:rollback; rake db:rollback RAILS_ENV=test'
alias nuke-test-db='rake db:drop RAILS_ENV=test; rake db:create RAILS_ENV=test; rake db:migrate RAILS_ENV=test; rake db:seed RAILS_ENV=test'

# rvm
alias rgu='rvm gemset use'
alias rgn='rvm gemset name'
alias ru='rvm use'

# tmux
alias tmx-attach-session='tmux -u2 attach-session -t'
alias tmx-detach-session='tmux detach-client -s'
alias mux='automux'

if $(on-mac)
then
  alias quarantine='xattr -d com.apple.quarantine'

  ntf() { $@; terminal-notifier-notify -message 'Process finished...'; tmux display-message 'Process finished...'; }
else
  ntf() { $@; notify-send -t 3000 'Process finished...'; }
fi
