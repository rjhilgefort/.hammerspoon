_ = require("moses")

class Reload
    -- Helpers ----------------------------------------------------------------
    defaultDir = os.getenv("HOME") .. "/.hammerspoon/"

    reload = () ->
        hs.reload()
        hs.notify.new({ title: "Hammerspoon Config Loaded" })\send()\release()

    filesChanged = (files = {}, extension = '.lua') ->
        _.each(files, (key, file) ->
            if file\sub(-4) == extension
                reload()
                return false
        )

    -- Instance ---------------------------------------------------------------
    @dir = nil

    new: (dir=defaultDir) =>
        @dir = dir

    reload: =>
        reload()

    watch: =>
        hs.pathwatcher.new(@dir, filesChanged)\start()

return Reload
