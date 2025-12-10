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
alias gre='git reset --soft HEAD~1; git reset'

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
alias cr='crush'
alias cu='cursor-agent'
alias cur='cursor-agent ls'
alias cul='cursor-agent resume'
alias cl='claude'
alias clr='claude -r'
# alias cx='codex'
# alias cxr='codex resume'
# alias cxl='codex resume --last'
# alias co='~/bin/code'
# alias col='~/bin/code resume --last'
alias gm='gemini'
alias we='qwen'
alias ko='~/projects/code-keen99/codex-rs/target/dev-fast/code'
alias kol='~/projects/code-keen99/codex-rs/target/dev-fast/code resume --last'
alias hh='htop'
alias px='peerflix --path ~/Videos'
alias smagnet='peerflix --path ~/Videos --no-quit -g'
alias ytmusic='ytdlp -i --extract-audio --prefer-ffmpeg --audio-format mp3'
alias ytr='ytdlp $(copyq read 0)'
alias ns='npm start'
alias ni='npm install'
alias niv='npm install --loglevel verbose'
alias ya='yarn add'
alias ct='batcat'
alias vchat='PATH="/usr/bin:$PATH" weechat' # brew python had missing functions in _ssl.so.
alias st-notes='terminator -l notes'
alias comic-dl='~/projects/comic-dl/comic_dl/__main__.py'
alias fd='/usr/bin/fdfind -I'
alias caps-enable='setxkbmap -layout us -option caps:enable'
alias caps-none='setxkbmap -layout us -option caps:none'
alias bri='brew install'
alias llm-upgrade='brew update && brew upgrade crush gemini-cli qwen-code'
alias orouter-credits='curl -H "Authorization: Bearer $OPENROUTER_API_KEY" https://openrouter.ai/api/v1/credits'

# python
alias py='python3'
alias pi='pip3 install'
alias pl='pip3 list'
alias pir='pip3 install -r requirements.txt'
alias venv='rm -rf venv; python3 -m venv venv'
alias va='source venv/bin/activate'
alias vd='deactivate'

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
alias se='source .env'

# tmux
alias tmx-attach-session='tmux -u2 attach-session -t'
alias tmx-detach-session='tmux detach-client -s'
alias tmx-new='tmux -u2 new-session -s'

# docket
alias d='docket'
alias dim='docket images'
alias dps='docket ps -a'
alias dc='sudo docker-compose'

# misc
alias k='kubectl'
alias screensaver-off='xset s off -dpms'
alias ra='ranger'
alias c-opyq-disable='copyq enable; sleep 2; copyq disable'

# nixos
alias nxsearch='nix-env -qaP | less'
alias nxinstall='nix-env -i'

alias t='harsh'
alias c-undo='rm -rf ~/.undodir/*'

if on-mac; then
  alias nvim='/opt/homebrew/bin/nvim -u ~/.vimrc $@'
  alias tfix='sudo sntp -sS time.apple.com'
  alias quarantine='xattr -d com.apple.quarantine'
  alias brstart-services='brew services start postgresql@14'
fi
