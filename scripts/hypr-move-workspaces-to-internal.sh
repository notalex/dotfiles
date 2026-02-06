internal=$(hyprctl monitors -j | jq -r '.[].name' | head -1)

for i in 3 7 8 9; do
  hyprctl dispatch moveworkspacetomonitor $i $internal
done
