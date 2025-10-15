require("hs.ipc")
hs.ipc.cliInstall()

local notesWindow = require("notesWindow")
local windowMover = require("windowMover")
local windowManager = require("windowManager")

local keyMappings = {
    {key = "1", title = "Hammerspoon Console", app = "Hammerspoon"},
    {key = "3", title = "small", app = "iTerm2"},
    {key = "6", title = "", app = "Chrome"},
    {key = "7", title = "neosonic", app = "iTerm2"},
    {key = "8", title = "", app = "Firefox"},
    {key = "9", title = "qutebrowser", app = "Qutebrowser"}
}

windowManager.bindKeyMappings(keyMappings)
hs.hotkey.bind({"alt"}, "n", notesWindow.toggleNotesWindow)
hs.hotkey.bind({"alt"}, "b", function() hs.eventtap.keyStroke({"alt"}, "tab") end)
hs.hotkey.bind({"alt"}, "right", function() windowMover.moveWindowBetweenDisplays() end)
hs.hotkey.bind({"alt"}, "left", function() windowMover.moveWindowBetweenDisplays() end)
