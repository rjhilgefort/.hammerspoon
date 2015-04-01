apps = {}

apps.toLaunch = {
    'iTerm', 'Google Chromee', 'Finder', 'Sonos', 'Messages', 'Spotify',
    'Simplify', '1Password mini', 'Clear', 'Sunrise', 'Airmail Beta',
    'Dash', 'Blink1Control'
}
apps.toKill = {
    'iTunes',   'System Preferences', '1Password', 'Battle.net'
}

-- TODO:
-- Capture all visible windows on all screens before doing anything else, then
--      refocus them after launching all the things
function apps.launchApps()
    for i,app in pairs(apps.toLaunch) do
        hs.application.launchOrFocus(app)
        app = hs.appfinder.appFromName(app)
        if (app ~= nil) then app:hide() end
    end
end

-- Kill any running apps in the kill list
function apps.killApps()
    for i,app in pairs(hs.application.runningApplications()) do
        if (hs.fnutils.contains(apps.toKill, app:title())) then app:kill() end
    end
end
