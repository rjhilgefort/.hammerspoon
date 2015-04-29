Reload = require "lua/reload"
Config = require "lua/config"

_ = require "lua/utils/moses"
userConfig = require "lua/hammerfork"


-- DEBUGGING
_.print "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ..
        "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
_.print '-----------------------------------------------'
_.print '-----------------------------------------------'
_.print "\n\n\n\n\n\n\n\n\n\n"
-- /DEBUGGING


-------------------------------------------------------------------------------
-- Setup
-------------------------------------------------------------------------------

-- Local vars
config = Config userConfig

-- Set up reload stuff
reload = Reload(os.getenv("HOME") .. "/.hammerspoon/lua/")
reload\watch!


-------------------------------------------------------------------------------
-- Keys
-------------------------------------------------------------------------------

hyper = { 'cmd', 'alt', 'ctrl' }


-------------------------------------------------------------------------------
-- Binds
-------------------------------------------------------------------------------

-- Reset environment
hs.hotkey.bind hyper, 'r', reload\reload

-- Playground
-- hs.hotkey.bind hyper, 's', ->
    -- hs.alert "hyper+s"
    -- _.each hs.application.runningApplications!, (key, app) -> _.print app\title!

-- Layout Test
hs.hotkey.bind hyper, 'c', ->
    hs.alert "hyper+c"
    config\layout 'playground'

-- Layout Demo
hs.hotkey.bind hyper, 'd', ->
    hs.alert "hyper+d"
    config\layout 'demo_a'
hs.hotkey.bind hyper, 'f', ->
    hs.alert "hyper+f"
    config\layout 'demo_b'
