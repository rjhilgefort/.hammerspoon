local hyper = { 'cmd', 'alt', 'ctrl' }
local hammerSpoonConfigDir = os.getenv("HOME") .. "/.hammerspoon/"


-- TODO:
-- Capture all visible windows on all screens before doing anything else, then
--      refocus them after launching all the things
function launchApps()
    local apps = {
        'iTerm', 'Google Chromee', 'Finder', 'Sonos', 'Messages', 'Spotify',
        'Simplify', '1Password mini', 'Clear', 'Sunrise', 'Airmail Beta',
        'Dash', 'Blink1Control'
    }

    for i,app in pairs(apps) do
        hs.application.launchOrFocus(app)
        app = hs.appfinder.appFromName(app)
        if (app ~= nil) then
            app:hide()
        end
    end
end

function killApps()
    local toKill = {
        'iTunes',   'System Preferences', '1Password'
    }

    local runningApps = hs.application.runningApplications()
    for i,app in pairs(runningApps) do
        if (hs.fnutils.contains(toKill, app)) then
            app:kill()
        end
    end
end


hs.hotkey.bind(hyper, 'c', function()
    hs.notify.new({ title = "hyper+c" }):send():release()
    -- hs.application.launchOrFocus('Dash')
    launchApps()
    killApps()
end)


-- Smart config reloading
function reloadConfig(files)
    for key,file in pairs(files) do
        if file:sub(-4) == '.lua' then
            hs.reload()
            break
        end
    end
end

hs.pathwatcher
    .new(hammerSpoonConfigDir, reloadConfig)
    :start()

hs.notify.new({
        title = "Hammerspoon Config Loaded",
        informativeText = "Change Detected In: \n" .. hammerSpoonConfigDir
    })
    :send()
    :release()
