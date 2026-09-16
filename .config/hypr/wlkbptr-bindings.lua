-- wl-kbptr & cursor submap bindings

hl.unbind("SUPER + F") -- was: Full screen
o.bind("SUPER + F", "wl-kbptr", "wl-kbptr -o modes=floating,click -o mode_floating.source=detect")

hl.unbind("SUPER + SHIFT + F") -- was: File manager
hl.bind("SUPER + SHIFT + F", function()
  hl.config({ cursor = { inactive_timeout = 0, hide_on_key_press = false } })
  hl.dispatch(hl.dsp.submap("cursor"))
end, { description = "Enter cursor submap" })

hl.bind("SUPER + Y", function()
  hl.exec_cmd("pkill -9 wl-kbptr")
  hl.dispatch(hl.dsp.submap("reset"))
end, { description = "Cancel wl-kbptr" })

hl.define_submap("cursor", function()
  hl.bind("f", hl.dsp.exec_cmd("hyprctl dispatch submap reset && wl-kbptr -o modes=floating,click -o mode_floating.source=detect && hyprctl dispatch submap cursor"))

  hl.bind("j", hl.dsp.exec_cmd("wlrctl pointer move 0 10"), { repeating = true })
  hl.bind("k", hl.dsp.exec_cmd("wlrctl pointer move 0 -10"), { repeating = true })
  hl.bind("l", hl.dsp.exec_cmd("wlrctl pointer move 10 0"), { repeating = true })
  hl.bind("h", hl.dsp.exec_cmd("wlrctl pointer move -10 0"), { repeating = true })

  hl.bind("SHIFT + j", hl.dsp.exec_cmd("wlrctl pointer move 0 80"), { repeating = true })
  hl.bind("SHIFT + k", hl.dsp.exec_cmd("wlrctl pointer move 0 -80"), { repeating = true })
  hl.bind("SHIFT + l", hl.dsp.exec_cmd("wlrctl pointer move 80 0"), { repeating = true })
  hl.bind("SHIFT + h", hl.dsp.exec_cmd("wlrctl pointer move -80 0"), { repeating = true })

  hl.bind("o", hl.dsp.exec_cmd("wlrctl pointer click left"))
  hl.bind("m", hl.dsp.exec_cmd("wlrctl pointer click middle"))
  hl.bind("r", hl.dsp.exec_cmd("wlrctl pointer click right"))

  hl.bind("t", hl.dsp.exec_cmd("wlrctl pointer scroll 30 0"), { repeating = true })
  hl.bind("g", hl.dsp.exec_cmd("wlrctl pointer scroll -30 0"), { repeating = true })

  hl.bind("a", hl.dsp.exec_cmd("wlrctl pointer scroll 0 -30"), { repeating = true })
  hl.bind("s", hl.dsp.exec_cmd("wlrctl pointer scroll 0 30"), { repeating = true })

  local function exit_cursor_submap()
    hl.config({ cursor = { inactive_timeout = 3, hide_on_key_press = true } })
    hl.dispatch(hl.dsp.submap("reset"))
  end

  hl.bind("escape", exit_cursor_submap)
  hl.bind("CTRL + bracketleft", exit_cursor_submap)
end)
