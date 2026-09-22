-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- Enable workspace cycles
hl.config({
  binds = {
    allow_workspace_cycles = true,
  },
})

-- Applications
hl.unbind("SUPER + SHIFT + D") -- was: Docker
o.bind("SUPER + SHIFT + D", "File manager", "uwsm-app -- nautilus --new-window")
o.bind("SUPER + D", "Omarchy menu", "omarchy-menu toggle")

-- Close window with SUPER + Q
hl.unbind("SUPER + W") -- was: Close window
o.bind("SUPER + Q", "Close window", hl.dsp.window.close())

-- Navigation with H/J/K/L
hl.unbind("SUPER + J") -- was: Toggle window split
hl.unbind("SUPER + K") -- was: Keybindings
hl.unbind("SUPER + L") -- was: Toggle workspace layout
o.bind("SUPER + H", "Focus left", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + L", "Focus right", hl.dsp.focus({ direction = "r" }))
o.bind("SUPER + K", "Focus up", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + J", "Focus down", hl.dsp.focus({ direction = "d" }))

-- Move into group with SUPER + SHIFT + H/J/K/L
o.bind("SUPER + SHIFT + H", "Move window into group left", hl.dsp.window.move({ into_group = "l" }))
o.bind("SUPER + SHIFT + L", "Move window into group right", hl.dsp.window.move({ into_group = "r" }))
o.bind("SUPER + SHIFT + K", "Move window into group up", hl.dsp.window.move({ into_group = "u" }))
o.bind("SUPER + SHIFT + J", "Move window into group down", hl.dsp.window.move({ into_group = "d" }))

-- Workspace navigation
o.bind("SUPER + B", "Previous workspace", hl.dsp.focus({ workspace = "previous" }))
o.bind("SUPER + SEMICOLON", "Move workspace to next monitor", hl.dsp.workspace.move({ monitor = "+1" }))

hl.unbind("SUPER + UP") -- was: Focus on above window
hl.unbind("SUPER + DOWN") -- was: Focus on below window
o.bind("SUPER + UP", nil, "bash ~/scripts/hypr-move-workspaces-to-external.sh")
o.bind("SUPER + DOWN", nil, "bash ~/scripts/hypr-move-workspaces-to-internal.sh")

o.bind("SUPER + N", nil, "bash ~/scripts/hypr-guake-toggle.sh")
o.bind("SUPER + M", "Cycle next window", function()
  local w = hl.get_active_window()
  if w and w.floating then
    hl.dispatch(hl.dsp.window.cycle_next({ mode = "tiled" }))
  else
    hl.dispatch(hl.dsp.window.cycle_next({ mode = "floating" }))
  end
end)

-- Group navigation
hl.unbind("SUPER + TAB") -- was: Next workspace
o.bind("SUPER + TAB", "Next window in group", hl.dsp.group.next())

-- Clipboard manager
hl.unbind("SUPER + CTRL + V") -- was: Clipboard manager (omarchy shell panel)
hl.unbind("SUPER + CTRL + P") -- was: Power
o.bind("SUPER + CTRL + P", "Clipboard manager", "omarchy-shell shell toggle omarchy.clipboard")

-- Dictation, screen recording, and screenshots
o.bind("SUPER + R", "Toggle dictation", "voxtype record toggle")
hl.unbind("SUPER + CTRL + R") -- was: Set reminder
o.bind("SUPER + CTRL + R", "Record screen", "omarchy-capture-screenrecording --stop-recording || omarchy-menu toggle trigger.capture.screenrecord")
hl.unbind("SUPER + CTRL + S") -- was: Share
o.bind("SUPER + CTRL + S", "Screenshot smart save", "omarchy capture screenshot smart save")

-- By default, the on:Lid switch locks screen & then calls omarchy-hyprland-monitor-clamshell
hl.unbind("switch:on:Lid Switch")
o.bind("switch:on:Lid Switch", nil, "omarchy-hyprland-monitor-clamshell", { locked = true })
