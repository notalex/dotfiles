local module = {}

local notesWindowFocused = false
local targetWindowTitle = "notes"
local targetAppName = "iTerm2"

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
            if not notesWindowFocused then
                targetWindow:focus()
                notesWindowFocused = true
            else
                hs.eventtap.keyStroke({"alt"}, "tab")
                notesWindowFocused = false
            end
        else
            hs.alert.show("Window with title 'notes' not found in " .. targetAppName)
        end
    else
        hs.alert.show("Application " .. targetAppName .. " not found")
    end
end

return module
