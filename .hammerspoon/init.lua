local notesWindow = require("notesWindow")
local windowMover = require("windowMover")
local windowManager = require("windowManager")

local keyMappings = {
    {key = "1", title = "Hammerspoon Console", app = "Hammerspoon"},
    {key = "2", title = "", app = "Cisco Secure Client"},
    {key = "3", title = "small", app = "iTerm2"},
    {key = "4", title = "", app = "Code"},
    {key = "5", title = "", app = "Google Chrome"},
    {key = "6", title = "Teams", app = "Microsoft Teams"},
    {key = "7", title = "ohloh", app = "iTerm2"},
    {key = "8", title = "servers", app = "iTerm2"},
    {key = "9", title = "qutebrowser", app = "Qutebrowser"}
}

windowManager.bindKeyMappings(keyMappings)
hs.hotkey.bind({"alt"}, "n", notesWindow.toggleNotesWindow)
hs.hotkey.bind({"alt"}, "b", function() hs.eventtap.keyStroke({"alt"}, "tab") end)
hs.hotkey.bind({"alt"}, "right", function() windowMover.moveWindowBetweenDisplays() end)
hs.hotkey.bind({"alt"}, "left", function() windowMover.moveWindowBetweenDisplays() end)
