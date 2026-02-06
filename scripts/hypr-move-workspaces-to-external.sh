external=$(hyprctl monitors -j | jq -r '.[].name' | tail -1)

for i in 3 7 8 9; do
  hyprctl dispatch moveworkspacetomonitor $i $external
done
