local hyper = { 'cmd', 'alt', 'ctrl' }
local hammerSpoonConfigDir = os.getenv("HOME") .. "/.hammerspoon/"

hs.hotkey.bind(hyper, 'c', function()
    hs.alert.show('DOING THE THING YOU WANTED')
    print()
end)


-- Smart config reloading
function reloadConfig(files)
    for _,file in pairs(files) do
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
