function focusWindow(targetWindowTitle, targetAppName)
    local app = hs.application.find(targetAppName) -- Find the specific application
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

local keyMappings = {
    {key = "1", title = "YouTube", app = "Google Chrome"},
    {key = "3", title = "small", app = "Terminal"},
    {key = "6", title = "Teams", app = "Microsoft Teams"},
    {key = "7", title = "ohloh", app = "Terminal"},
    {key = "8", title = "servers", app = "Terminal"},
    {key = "n", title = "notes", app = "Terminal"},
    {key = "9", title = "qutebrowser", app = "Qutebrowser"}
}

for _, mapping in ipairs(keyMappings) do
    hs.hotkey.bind({"alt"}, mapping.key, function()
        focusWindow(mapping.title, mapping.app)
    end)
end
