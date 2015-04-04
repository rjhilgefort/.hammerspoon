class Reload
    -- Helpers ----------------------------------------------------------------
    defaultDir = os.getenv("HOME") .. "/.hammerspoon/"

    reload = (files) ->
        hs.reload()
        hs.notify.new({
                title: "Hammerspoon Config Loaded",
            })\send()\release()

    filesChanged = (files={}, extension='.lua') ->
        for _,file in pairs(files) do
            if file\sub(-4) == extension
                reload()
                break

    -- Instance ---------------------------------------------------------------
    @dir = nil

    new: (dir=defaultDir) =>
        @dir = dir

    reload: =>
        reload()

    watch: =>
        hs.pathwatcher.new(@dir, filesChanged)\start()

return Reload
