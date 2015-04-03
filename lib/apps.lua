-- List of all apps
apps = {
    'iTerm',
    chrome = 'Google Chrome',
    'Finder',
    'Sonos',
    'Messages',
    'Spotify',
    'Simplify',
    onePassword = '1Password',
    onePasswordMini = '1Password mini',
    'Clear',
    'Sunrise',
    airmail = { app = 'Airmail Beta', title = 'Airmail' },
    'Dash',
    blink = 'Blink1Control',
    'Hammerspoon',
    'HipChat',
    'Dropbox',
    'iTunes',
    'System Preferences',
    battleNet = 'Battle.net',
    'Xcode',
    'Cobook'
}

-- process apps
print("\n\n\nAPPS DEF:")
for _,app in pairs(apps) do
    print(app)
end
print("\n\n\n")


toLaunch = {
    'iTerm', 'Google Chrome', 'Finder', 'Sonos', 'Messages', 'Spotify',
    'Simplify', '1Password mini', 'Clear', 'Sunrise', 'Airmail Beta',
    'Dash', 'Blink1Control', 'Hammerspoon', 'HipChat', 'Dropbox'
}
toKill = {
    'iTunes',   'System Preferences', '1Password', 'Battle.net', 'Xcode',
    'Cobook'
}

-- TODO:
-- Capture all visible windows on all screens before doing anything else, then
--      refocus them after launching all the things
function apps.launchApps()
    for _,appName in pairs(toLaunch) do
        hs.application.launchOrFocus(appName)
        local app = hs.appfinder.appFromName(appName)
        if (app ~= nil) then
            print("Hiding " .. appName)
            app:hide()
        end
    end
end

-- Kill any running apps in the kill list
function apps.killApps()
    for i,app in pairs(hs.application.runningApplications()) do
        if (hs.fnutils.contains(toKill, app:title())) then app:kill() end
    end
end
