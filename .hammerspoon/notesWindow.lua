local module = {}

local stateFilePath = "/tmp/notesWindowState"
local targetWindowTitle = "notes"
local targetAppName = "iTerm2"

local function isNotesWindowFocused()
    return io.open(stateFilePath, "r") and true or false
end

local function touchNotesWindowState()
    io.open(stateFilePath, "w"):close()
end

function module.toggleNotesWindow()
    local app = hs.application.find(targetAppName)
    if app then
        local targetWindow = nil
        for _, win in ipairs(app:allWindows()) do
            if win:title():lower():find(targetWindowTitle:lower()) then
                targetWindow = win
                break
            end
        end

        if targetWindow then
            if not isNotesWindowFocused() then
                targetWindow:focus()
                touchNotesWindowState()
            else
                hs.eventtap.keyStroke({"alt"}, "tab")
                os.remove(stateFilePath)
            end
        else
            hs.alert.show("Window with title 'notes' not found in " .. targetAppName)
        end
    else
        hs.alert.show("Application " .. targetAppName .. " not found")
    end
end

return module
