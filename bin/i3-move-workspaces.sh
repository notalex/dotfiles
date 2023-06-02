xmodmap ~/.Xmodmap

for i in 3 7 8 9; do
  i3-msg workspace $i
  i3-msg move workspace to output right
done
