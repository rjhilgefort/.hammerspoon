local reload = {}

-- Smart config reloading
function reload.config(files)
    for key,file in pairs(files) do
        if file:sub(-4) == '.lua' then
            hs.reload()
            break
        end
    end
end

-- Go ahead and setup watcher
hs.pathwatcher
    .new(hammerSpoonConfigDir, reload.config)
    :start()
hs.notify.new({
        title = "Hammerspoon Config Loaded",
        informativeText = "Change Detected In: \n" .. hammerSpoonConfigDir
    })
    :send()
    :release()
