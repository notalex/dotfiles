-- Right Alt macros (MOD5)
-- Configured via ISO_Level3_Shift in input.lua (lv3:ralt_switch)

local function send_macro_key(key, mods, timeout)
  return function()
    local m = mods or ""
    local t = timeout or 20
    hl.dispatch(hl.dsp.send_key_state({ mods = m, key = key, state = "down" }))
    hl.timer(function()
      hl.dispatch(hl.dsp.send_key_state({ mods = m, key = key, state = "up" }))
    end, { timeout = t, type = "oneshot" })
  end
end

o.bind("MOD5 + V", "Universal Paste", send_macro_key("V", "CTRL + SHIFT", 50))

-- Navigation & editing macros (repeat on hold enabled)
o.bind("MOD5 + N", "Arrow Down", send_macro_key("Down", "", 15), { repeating = true })
o.bind("MOD5 + P", "Arrow Up", send_macro_key("Up", "", 15), { repeating = true })
o.bind("MOD5 + I", "Tab", send_macro_key("Tab", "", 15), { repeating = true })
o.bind("MOD5 + O", "Back Tab (Shift+Tab)", send_macro_key("Tab", "SHIFT", 15), { repeating = true })
o.bind("MOD5 + M", "Enter", send_macro_key("Return", "", 20), { repeating = true })
o.bind("MOD5 + H", "Backspace", send_macro_key("BackSpace", "", 15), { repeating = true })
