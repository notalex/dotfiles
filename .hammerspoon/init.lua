require("hs.ipc")
hs.ipc.cliInstall()

local mod = "alt"
local notesWindow = require("notesWindow")
local windowMover = require("windowMover")
local windowManager = require("windowManager")

local keyMappings = {
    {key = "1", title = "Hammerspoon Console", app = "Hammerspoon"},
    {key = "2", title = "", app = "Cisco"},
    {key = "3", title = "small", app = "iTerm2"},
    {key = "4", title = "", app = "Chrome"},
    {key = "5", title = "", app = "Teams"},
    {key = "7", title = "fisbot", app = "iTerm2"},
    {key = "8", title = "servers", app = "iTerm2"},
    {key = "9", title = "qutebrowser", app = "Qutebrowser"}
}

windowManager.bindKeyMappings(mod, keyMappings)
hs.hotkey.bind({mod}, "n", notesWindow.toggleNotesWindow)
hs.hotkey.bind({mod}, "b", function() hs.eventtap.keyStroke({"alt"}, "tab") end)
hs.hotkey.bind({mod}, "right", function() windowMover.moveWindowBetweenDisplays() end)
hs.hotkey.bind({mod}, "left", function() windowMover.moveWindowBetweenDisplays() end)
