defaultDir = os.getenv("HOME") .. "/.hammerspoon/"

class Reload
    -- Helpers ----------------------------------------------------------------
    reload = (files) =>
        if type files == nil then return
        for _,file in pairs files do
            if file\sub(-4) == '.lua'
                hs.reload()
                break

    -- Instance ---------------------------------------------------------------
    new: (dir=defaultDir) =>
        @dir = dir

    watch: () =>
        print @dir
        hs.pathwatcher.new(@dir, reload)\start()
        hs.notify.new({
                title: "Hammerspoon Config Loaded",
                informativeText: "Change Detected In: \n" .. @dir
            })\send()\release()

return Reload
