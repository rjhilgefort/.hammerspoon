-- global vars used by errthing
hammerSpoonConfigDir = os.getenv("HOME") .. "/.hammerspoon/"
hyper = { 'cmd', 'alt', 'ctrl' }

require("lib/reload")
require("lib/apps")

-- playground
hs.hotkey.bind(hyper, 'd', function()
    hs.notify.new({ title = "hyper+d" }):send():release()
end)

-- reset environment
hs.hotkey.bind(hyper, 'c', function()
    hs.notify.new({ title = "hyper+c" }):send():release()
    apps.launchApps()
    apps.killApps()
end)
