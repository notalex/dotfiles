# vim: set ft=sh:

# git push
alias staging_push="git push staging release:master"
alias m_staging_push="git push staging release:master && h_migrate s && h_assets_precompile s"
alias h='heroku run'

# git
alias gar="git add -A"
alias gaf="git add -f"
alias gan="ge git add -N"
alias gap="ge git add -p"
alias gcm="git commit -m"
alias gcma="git commit --amend"
alias gcam="git commit -a -m"
alias grl="git reflog"
alias g_config="git config --list"
alias gra="git remote add"
alias gb="git branch -v"
ggrep() { git log --oneline --grep=$1; }

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

# gems
alias cuke_spork='rake db:test:prepare && spork cucumber'
delayed_emails() { rake jobs:clear; rake jobs:work; }

# rvm
alias rgu='rvm gemset use'
alias rgn='rvm gemset name'
alias ru='rvm use'
