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




   -- Class ------------------------------------------------------------------
   @processConfTable: (conf) =>
      conf = _.enTable conf

      -- Handle `apps`
      conf.apps = _.enTable conf.apps
      conf.apps = _.map conf.apps, (key, app) ->
         if _.isString app then app = { name: app }
         if not _.isTable app then return message.badTable 'app', app
         app.title = _.enString app.title, app.name
         return app

      -- Handle `layouts`
      conf.layouts = _.enTable conf.layouts
      conf.layouts = _.map conf.layouts, (key, layout) ->
         layout = _.enTable layout
         layout.launch = _.enTable layout.launch
         layout.kill = _.enTable layout.kill
         return layout

      return conf


return Config

-- TODO:
-- Capture all visible windows on all screens before doing anything else, then
--      refocus them after launching all the things
-- function apps.launchApps()
--     for _,appName in pairs(toLaunch) do
--         hs.application.launchOrFocus(appName)
--         local app = hs.appfinder.appFromName(appName)
--         if (app ~= nil) then
--             print("Hiding " .. appName)
--             app:hide()
--         end
--     end
-- end

-- Kill any running apps in the kill list
-- function apps.killApps()
--     for i,app in pairs(hs.application.runningApplications()) do
--         if (hs.fnutils.contains(toKill, app:title())) then app:kill() end
--     end
-- end
