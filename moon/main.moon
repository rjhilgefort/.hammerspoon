Reload = require("lua/reload")
-- require("lib/apps")

hammerSpoonConfigDir = os.getenv("HOME") .. "/.hammerspoon/lua/"
hyper = { 'cmd', 'alt', 'ctrl' }

reload = Reload(hammerSpoonConfigDir)
reload\watch()

-- playground
hs.hotkey.bind(hyper, 'd', ->
    hs.notify.new({ title: "hyper+d" })\send()\release()

    running = hs.application.runningApplications()
    for _,app in pairs(running)
        print(app\title())
)

-- Reset environment
hs.hotkey.bind(hyper, 'r', reload\reload)
hs.hotkey.bind(hyper, 'c', ->
    hs.notify.new({ title: "hyper+c" })\send()\release()
    -- apps.launchApps
    -- apps.killApps
)
