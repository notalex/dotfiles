while getopts r:f flag; do
 case $flag in
   r) partial_remote_name=$OPTARG ;;
   f) force=true ;;
 esac
done

remote_name() {
  [ -z "$partial_remote_name" ] && echo 'origin' && return
  eval "git remote show | grep -o '[^ ]*${partial_remote_name}[^ ]*'"
}

force_option() {
  [[ "$@" =~ '-f' ]] && echo '-f'
}

remote_branch_name() {
  case $@ in
    d) echo "develop" ;;
    r) echo "release" ;;
    m) echo "master" ;;
    t) echo "temp" ;;
    *) branch_name ;;
  esac
}

branch_name() {
  git rev-parse --abbrev-ref HEAD
}

write_pushed_head() {
  current_git_head=$(git log -1 --oneline | awk '{print $1}')
  echo $current_git_head > $PWD/.git/pushed_head
}
