_ = require "lua/utils/moses"

class Reload
    -- Helpers ----------------------------------------------------------------
    filesChanged = (files={}, extension='.lua') ->
        _.each files, (key, file) ->
            if file\sub(-4) == extension
                @@reload!
                return false

    -- Instance ---------------------------------------------------------------
    new: (dir=@@defaultHammerspoonHome) =>
        @dir = dir

    reload: =>
        @@reload!

    watch: =>
        watcher = hs.pathwatcher.new @dir, filesChanged
        watcher\start!

    -- Class ------------------------------------------------------------------
    @defaultHammerspoonHome = os.getenv("HOME") .. "/.hammerspoon/"

    @reload: () ->
        hs.reload!
        notify = hs.notify.new({ title: "Hammerspoon Config Loaded" })
        notify\send!
        notify\release!

return Reload
