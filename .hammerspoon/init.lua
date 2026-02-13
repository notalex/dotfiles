require("hs.ipc")
hs.ipc.cliInstall()

local mod = "alt"
local notesWindow = require("notesWindow")
local windowMover = require("windowMover")
local windowManager = require("windowManager")

local keyMappings = {
    {key = "0", title = "Hammerspoon Console", app = "Hammerspoon"},
    {key = "1", title = "", app = "Code"},
    {key = "2", title = "", app = "Cisco"},
    {key = "3", title = "small", app = "iTerm2"},
    {key = "4", title = "", app = "Teams"},
    {key = "5", title = "pomo", app = "iTerm2"},
    {key = "6", title = "", app = "Chrome"},
    {key = "7", title = "fisbot", app = "iTerm2"},
    {key = "8", title = "servers", app = "iTerm2"},
    {key = "9", title = "qutebrowser", app = "Qutebrowser"}
}

windowManager.bindKeyMappings(mod, keyMappings)
hs.hotkey.bind({mod}, "n", notesWindow.toggleNotesWindow)
hs.hotkey.bind({mod}, "b", function() hs.eventtap.keyStroke({"alt"}, "tab") end)
hs.hotkey.bind({mod}, ";", function() windowMover.moveWindowBetweenDisplays() end)
