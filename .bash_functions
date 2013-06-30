automux_installed() {
  gem list | grep automux 1> /dev/null
}

add_to_path() {
 [[ $PATH != *$1* ]] && PATH=$PATH:$1
}

alternate-fox() {
  /Applications/Firefox.app/Contents/MacOS/firefox -p Alternate &> /dev/null &
}
