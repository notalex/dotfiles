local module = {}

function module.moveWindowBetweenDisplays()
    local window = hs.window.focusedWindow()
    if window then
        local currentScreen = window:screen()
        local allScreens = hs.screen.allScreens()

        if #allScreens > 1 then
            local currentScreenId = currentScreen:id()
            local nextScreen

            for i, screen in ipairs(allScreens) do
                if screen:id() == currentScreenId then
                    nextScreen = allScreens[(i % #allScreens) + 1]
                    break
                end
            end

            local frame = nextScreen:frame()
            local windowFrame = window:frame()

            window:setFrame({
                x = frame.x + (windowFrame.x - currentScreen:frame().x),
                y = frame.y + (windowFrame.y - currentScreen:frame().y),
                w = windowFrame.w,
                h = windowFrame.h
            })
        end
    end
end

return module
