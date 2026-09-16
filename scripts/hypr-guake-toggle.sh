guake && sleep 0.08

if [ "$(guake --is-visible)" = "1" ]; then
  hyprctl dispatch 'hl.dsp.window.cycle_next({ mode = "tiled" })'
  hyprctl dispatch 'hl.dsp.window.cycle_next({ mode = "floating" })'
fi
