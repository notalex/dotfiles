# vim: set ft=sh:

# git push
alias h='heroku run'
alias h_pg_info="heroku pg:info --app=ikonverse-staging"
hr() { heroku run $@ --app ikonverse-staging; }
hk() { heroku $@ --app ikonverse-staging; }

# git
alias gar="git add -A"
alias gaf="git add -f"
alias gan="ge git add -N"
alias gcm="git commit -m"
alias gcma="git commit --amend"
alias gc-am="git commit -a -m"
alias grl="git reflog"
alias g_config="git config --list"
alias gra="git remote add"
alias gbv="git branch -v"
alias gdf="ge git diff --color-words"
alias gdfc="ge git diff --cached --color-words"
ggrp() { cmd="git log --oneline --grep='$@'"; echo $cmd; eval $cmd; }
gstshow() { git stash show -p stash@{$1} $2; }
gstapply() { git stash apply stash@{$1} $2; }
gshn() { git show HEAD~$1; }

# bash
alias src='source ~/.bashrc'
alias apti='sudo apt-get install'
alias aptr='sudo apt-get remove'
alias apts='sudo apt-cache search'
dpks() { cmd="dpkg --get-selections | grep $1"; echo $cmd; eval $cmd; }
pag() { cmd="ps aux | grep $1"; echo $cmd; eval $cmd; }
pagm() { cmd="ps aux --sort -rss | less"; echo $cmd; eval $cmd; }
les() { $@ | less; }
hel() { $@ --help; }
alias ccd='pushd > /dev/null'
alias pcd='popd > /dev/null'
alias kr-spork="kill -9 $(ps aux | grep -m 1 spork | awk '{print $2}') ; spork cucumber"
alias speed_test="wget --output-document=/dev/null http://speedtest.sea01.softlayer.com/speedtest/speedtest/random1000x1000.jpg"
alias disk-usage="du -h --max-depth=1 $@"
xin() { echo $@ | xclip -selection clipboard; }
xout() { xclip -o -selection clipboard; }

# gems
alias cuke_spork='rake db:test:prepare && spork cucumber'
alias migrate_spork='rake db:migrate RAILS_ENV=test; spork cucumber'
alias recreate-test-db='rake db:drop RAILS_ENV=test; rake db:create RAILS_ENV=test; rake db:migrate RAILS_ENV=test --trace;'
alias test-migrate='rake db:migrate RAILS_ENV=test --trace;'
alias redo_migrate_spork='rake db:migrate:redo RAILS_ENV=test; spork cucumber'
delayed_emails() { rake jobs:clear; rake jobs:work; }
alias cux='cucumber --no-source -p all_drivers features/'
alias cappy='cap production deploy; cap production-pinnacle deploy'
alias commonly-failing-tests-run='cucumber -p all_drivers features/suggest_participants.feature features/todo.feature features/snippet_rules.feature features/related_conversations.feature'

# rvm
alias rgu='rvm gemset use'
alias rgn='rvm gemset name'
alias ru='rvm use'
