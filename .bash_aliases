# git push
alias staging_push="git push staging release:master"
alias m_staging_push="git push staging release:master && h_migrate s && h_assets_precompile s"
alias h='heroku run'

# git
alias gar="git add -A"
alias gap="ge git add -p"
alias gcm="git commit -m"
alias gcma="git commit --amend"
alias gcam="git commit -a -m"
alias gdb="git diff --name-only"
alias gdf="git diff --name-status"
alias gl="git log --oneline -5"
alias glog="git log --oneline"
alias grl="git reflog"
alias g_config="git config --list"
alias gra="git remote add"

# bash
alias src='source ~/.bashrc'
alias apti='sudo apt-get install'
alias aptr='sudo apt-get remove'
alias apts='sudo apt-cache search'
alias dpks='dpkg --get-selections'

# gems
alias cuke_spork='rake db:test:prepare && spork cucumber'
alias delayed_emails='echo rake jobs:clear and rake jobs:work ; rake jobs:clear ; rake jobs:work'

# rvm
alias rgu='rvm gemset use'
alias rgn='rvm gemset name'
alias ru='rvm use'
