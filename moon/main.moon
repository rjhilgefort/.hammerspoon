-- global vars used by errthing
hammerSpoonConfigDir = os.getenv("HOME") .. "/.hammerspoon/"
hyper = { 'cmd', 'alt', 'ctrl' }

-- require("lib/reload")
-- require("lib/apps")

-- playground
hs.hotkey.bind hyper, 'd', ->
    hs.notify.new({ title: "hyper+d" })\send()\release()

    running = hs.application.runningApplications
    for _,app in pairs running
        print(app\title())


-- reset environment
-- hs.hotkey.bind hyper, 'c', ->
--     hs.notify.new { title = "hyper+c" } :send :release
--     apps.launchApps
--     apps.killApps
