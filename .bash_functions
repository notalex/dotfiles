automux_installed() {
  gem list | grep automux 1> /dev/null
}

add_to_path() {
 [[ $PATH != *$1* ]] && PATH=$PATH:$1
}
