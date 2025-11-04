get_keyboard_ids() {
  xinput list --short | awk '/slave[[:space:]]*keyboard/ {
    if (match($0, /id=[0-9]+/)) print substr($0, RSTART+3, RLENGTH-3)
  }'
}
