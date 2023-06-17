# vim: set ft=sh:

# Heroku
alias h-tail='heroku logs --tail'
alias h-pg-info='heroku pg:info'
alias h-console="heroku run \"echo '$(cat ~/.inputrc)' > .inputrc; rails c\""

# git
alias gar="git add -A"
alias gan="ge git add -N"
alias gcma="git commit --amend"
alias gcma-v="git commit --amend --no-verify"
alias gc-am="git commit -a -m"
alias grl="git reflog"
alias g-config="git config --list"
alias gra="git remote add"
alias gbv="git branch -v"
alias g-save="git stash; git stash apply"
alias gpl-src='git pull src master'
alias gbo='git checkout --orphan'
alias gpo='git pull origin'
alias grsh9='git reset --hard HEAD~9'
alias gst='git stash'
alias gsta='git stash apply'
alias gstp='git stash pop'
alias gdel='ge git del'

# bash
alias s='sudo'
alias v='vagrant'
alias src='source ~/.bash_profile'
alias appa='sudo add-apt-repository -y'
alias apti='sudo apt-get install -y --force-yes'
alias aptr='sudo apt-get remove --purge -y'
alias apts='apt-cache search'
alias aupdate='sudo apt-get update'
alias ccd='pushd > /dev/null'
alias pcd='popd > /dev/null'
alias sptest="wget --output-document=/dev/null http://speedtest.sea01.softlayer.com/speedtest/speedtest/random1000x1000.jpg"
alias disk-usage="du -h --max-depth=1 $@"
alias xout='xclip -o -selection clipboard'
alias zzh='sudo pm-hibernate'
alias u-un-mount="sudo umount /media/usb"
alias wifi-restart='nmcli radio wifi off && nmcli radio wifi on'
alias wifi-list='nmcli device wifi list'
alias camera-disable='sudo modprobe -r uvcvideo'
alias udu="udiskie-umount /media/$USER/*"
alias tso='tmux set-option -g status off'
alias cl='curl -O'
alias hh='htop'
alias px='peerflix --path ~/Videos'
alias smagnet='peerflix --path ~/Videos --no-quit -g'
alias ytmusic='youtube-dl -i --extract-audio --prefer-ffmpeg --audio-format mp3'
alias ytr='youtube-dl $(copyq read 0)'
alias ns='npm start'
alias ni='npm install'
alias niv='npm install --loglevel verbose'
alias ya='yarn add'
alias vchat='PATH="/usr/bin:$PATH" weechat' # brew python had missing functions in _ssl.so.
alias st-notes='terminator -l notes'
alias comic-dl='~/projects/comic-dl/comic_dl/__main__.py'
alias fd='/usr/bin/fdfind -I'

# gems
alias cux='ntf cucumber --no-source -p run_all features/'
alias mnt='ruby -Itest test/'
alias mns='ntf ruby -Ispec spec/'
alias mnr='ntf rspec spec/'
alias rjw='rake jobs:work'
alias bi='bundle install'
alias gi='gem install'

# rails
alias rgm='bundle exec rails generate migration'
alias rdm='bundle exec rake db:migrate'
alias rdmt='RAILS_ENV=test bundle exec rake db:migrate'
alias rdst='RAILS_ENV=test rake db:drop && rake db:create && rake db:structure:load'
alias rdtp='RAILS_ENV=test bundle exec rake db:test:prepare'
alias rta='bundle exec rake test:all'
alias rd-migrate-redo='bundle exec rake db:migrate:redo'
alias rd-migrate-redo-t='bundle exec rake db:migrate:redo; bundle exec rake db:migrate:redo RAILS_ENV=test'
alias rd-rollback='bundle exec rake db:rollback'
alias rd-rollback-t='bundle exec rake db:rollback; bundle exec rake db:rollback RAILS_ENV=test'
alias nuke-test-db='bundle exec rake db:drop RAILS_ENV=test; bundle exec rake db:create RAILS_ENV=test; bundle exec rake db:migrate RAILS_ENV=test; bundle exec rake db:seed RAILS_ENV=test'
alias be='bundle exec'

# tmux
alias tmx-attach-session='tmux -u2 attach-session -t'
alias tmx-detach-session='tmux detach-client -s'
alias tmx-new='tmux -u2 new-session -s'

# docker
alias d='sudo docker'
alias dim='sudo docker images'
alias dps='sudo docker ps -a'

# misc
alias k='kubectl'

# nixos
alias nxsearch='nix-env -qaP | less'
alias nxinstall='nix-env -i'

alias t='harsh'
alias c-undo='rm -rf ~/.undodir/*'

$(on-mac) && alias quarantine='xattr -d com.apple.quarantine'
