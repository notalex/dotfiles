#!/bin/bash
# Auto-disable internal display (eDP-2) when HDMI is connected

handle_monitors() {
  if hyprctl monitors | grep -q "HDMI-A-1"; then
    hyprctl keyword monitor "eDP-2, disable" 2>/dev/null
  else
    hyprctl keyword monitor "eDP-2, preferred, auto, 1" 2>/dev/null
  fi
}

handle_monitors

# Subscribe to monitor events and re-run on changes
hyprctl monitors -j | head -1 >/dev/null  # Ensure hyprctl is ready
socat -u UNIX-CONNECT:/$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - |
  while read -r line; do
    case "$line" in
      monitoradded*|monitorremoved*)
        sleep 0.5  # Small delay for monitor to fully initialize
        handle_monitors
        ;;
    esac
  done
