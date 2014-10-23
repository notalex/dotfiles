# vim: set ft=sh:

# Heroku
alias h-tail='heroku logs --tail'
alias h-pg-info='heroku pg:info'
alias h-console="heroku run \"echo '$(cat ~/.inputrc)' > .inputrc; rails c\""

# git
alias gar="git add -A"
alias gan="ge git add -N"
alias gcma="git commit --amend"
alias gc-am="git commit -a -m"
alias grl="git reflog"
alias g-config="git config --list"
alias gra="git remote add"
alias gbv="git branch -v"
alias g-save="git stash; git stash apply"
alias gpl-src='git pull src master'

# bash
alias s='sudo'
alias v='vagrant'
alias src='source ~/.bash_profile'
alias appa='sudo add-apt-repository'
alias apti='sudo apt-get install -y --force-yes'
alias aptr='sudo apt-get remove -y'
alias apts='apt-cache search'
alias ccd='pushd > /dev/null'
alias pcd='popd > /dev/null'
alias sptest="wget --output-document=/dev/null http://speedtest.sea01.softlayer.com/speedtest/speedtest/random1000x1000.jpg"
alias disk-usage="du -h --max-depth=1 $@"
alias xout='xclip -o -selection clipboard'
alias zzh='sudo pm-hibernate'
alias u-un-mount="sudo umount /media/usb"
alias hdmi-connect="xrandr --output VGA1 --off; xrandr --output HDMI1 --auto --left-of eDP1; xmodmap ~/.Xmodmap"
alias vga-connect="xrandr --output HDMI1 --off; xrandr --output VGA1 --auto --right-of eDP1; xmodmap ~/.Xmodmap"

# gems
alias spc='spork cucumber'
alias cuke-spork='rake db:test:prepare && spork cucumber'
alias migrate-spork='rake db:migrate RAILS_ENV=test; spork cucumber'
alias reset-spork='rake db:reset RAILS_ENV=test; rake db:migrate RAILS_ENV=test; spork'
alias recreate-test-db='rake db:drop RAILS_ENV=test; rake db:create RAILS_ENV=test; rake db:migrate RAILS_ENV=test --trace;'
alias test-migrate='rake db:migrate RAILS_ENV=test --trace;'
alias redo-migrate-spork='rake db:migrate:redo RAILS_ENV=test; spork cucumber'
alias cux='ntf cucumber --no-source -p run_all features/'
alias mnt='ruby -Itest test/'
alias mns='ntf ruby -Ispec spec/'
alias mnr='ntf rspec spec/'
alias cappy='cap production deploy; cap production-pinnacle deploy'
alias commonly-failing-tests-run='cucumber -p run_all features/suggest_participants.feature features/todo.feature features/snippet_rules.feature features/related_conversations.feature features/first_time_user.feature'
alias ikonverse-ssh-server='thin start --ssl --ssl-verify --ssl-key-file ~/Documents/ikonverse/\*.ikonverse-dev.com.key --ssl-cert-file ~/Documents/ikonverse/\*.ikonverse-dev.com.crt'
alias rjw='rake jobs:work'
alias bi='bundle install'

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

# docker
alias d='docker'
alias dr='docker run'

$(on-mac) && alias quarantine='xattr -d com.apple.quarantine'
