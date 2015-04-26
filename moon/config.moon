_ = require "lua/utils/moses"
message = require "lua/utils/message"


class Config
   -- Helpers ----------------------------------------------------------------

   -- Instance ---------------------------------------------------------------
   new: (conf) =>
      -- TODO: if apps is string and ends in json, read from there
      -- if _.isString conf then -- TODO: load config file on the fly from path (conf)
      if not _.isTable conf then return message.badTable 'conf'
      @conf = @@processConfTable conf


   processConfTable: =>
      @conf = @@processConfTable @conf


   -- TODO: Capture all visible windows on all screens before doing anything else, then
   --      refocus them after launching all the things
   layout: (id) =>
      message.log "LAYOUT: "..id
      id = _.enString id
      if _.isNil @conf.layouts[id] then return message.error "layout: '"..id.."' not found"

      layout = @conf.layouts[id]

      -- launch each and try to hide it based on title
      if _.has layout, 'launch' then
         _.each layout.launch, (key, appId) ->
            app = @conf.apps[appId]
            hs.application.launchOrFocus(app.id)
            application = hs.appfinder.appFromName(app.title)
            if _.isPresent application then application\hide!

      -- kill each
      if _.has layout, 'kill' then
         _.each hs.application.runningApplications!, (key, application) ->
            if _.contains _.pluck(layout.kill, 'title'), application\title!
               application\kill!


   -- Class ------------------------------------------------------------------
   @processConfTable: (conf) =>
      conf = _.enTable conf

      -- Handle `apps`
      conf.apps = _.enTable conf.apps
      conf.apps = _.map conf.apps, (key, app) ->
         if _.isString app then app = { title: app }
         if not _.isTable app then return message.badTable 'app', app
         app.name = _.enString app.name, app.title
         return app

      -- Handle `layouts`
      conf.layouts = _.enTable conf.layouts
      conf.layouts = _.map conf.layouts, (layoutId, layout) ->
         layout = _.enTable layout

         -- Inflace all appIds
         return _.map layout, (listId, list) ->
            if _.isString list then list = { list }
            list = _.enTable list
            return _.map list, (key, appId) ->
               app = conf.apps[appId]
               if _.isNil app then return message.alert "APP NOT FOUND: 'layouts."..layoutId.."."..listId.."."..appId.."'"
               return app

      return conf


return Config
