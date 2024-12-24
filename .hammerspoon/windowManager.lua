local module = {}

function module.focusWindow(targetWindowTitle, targetAppName)
    local app = hs.application.find(targetAppName)
    if app then
        for _, win in ipairs(app:allWindows()) do
            if win:title():find(targetWindowTitle) then
                win:focus()
                return
            end
        end
        hs.alert.show("Window not found: " .. targetWindowTitle)
    else
        hs.alert.show("Application not found: " .. targetAppName)
    end
end

function module.bindKeyMappings(keyMappings)
    for _, mapping in ipairs(keyMappings) do
        hs.hotkey.bind({"alt"}, mapping.key, function()
            module.focusWindow(mapping.title, mapping.app)
        end)
    end
end

return module
