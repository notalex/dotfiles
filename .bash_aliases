alias gar="git add -A"
alias gcm="git commit -m"
alias gcma="git commit --amend"
alias gcam="git commit -a -m"
alias gap="ge git add -p"
alias gdb="git diff --name-only"
alias delayed_emails='echo rake jobs:clear and rake jobs:work ; rake jobs:clear ; rake jobs:work'

alias production_push="git push production master"
alias staging_push="git push staging release:master"
alias testing_push="git push testing release:master"
alias m_production_push="git push production master && h_migrate m && h_assets_precompile m"
alias m_staging_push="git push staging release:master && h_migrate s && h_assets_precompile s"
alias m_testing_push="git push testing release:master && h_migrate t && h_assets_precompile t"
alias h='heroku run'

alias gdf="git diff --name-status"
alias gl="git log --oneline -5"
alias glog="git log --oneline"
alias grl="git reflog"

alias screem='screen -c ~/.screen/screem'
alias screemini='screen -c ~/.screen/screemini'
