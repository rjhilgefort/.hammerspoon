 -- cause life is hard
print "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
        "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

_ = require "lua/utils/moses"
Reload = require "lua/reload"
Apps = require "lua/apps"

-- Local vars
hammerSpoonConfigDir = os.getenv "HOME" .. "/.hammerspoon/lua/"
hyper = { 'cmd', 'alt', 'ctrl' }

-- Set up reload stuff
reload = Reload hammerSpoonConfigDir
reload\watch!

apps = Apps!

-- Reset environment
hs.hotkey.bind hyper, 'r', reload\reload

-- Playground
hs.hotkey.bind hyper, 'd', ->
    hs.alert "hyper+d"
    _.each hs.application.runningApplications!, (key, app) -> print app\title!

-- Playground
hs.hotkey.bind hyper, 'c', ->
    hs.alert "hyper+c"
    -- apps.launchApps
    -- apps.killApps
