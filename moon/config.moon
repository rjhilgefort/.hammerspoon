_ = require "lua/utils/moses"
message = require "lua/utils/message"


class Config
   -- Helpers ----------------------------------------------------------------

   -- Instance ---------------------------------------------------------------
   new: (params) =>
      -- TODO: if apps is string and ends in json, read from there
      -- if _.isString params then -- TODO: load config file on the fly from path (params)
      if not _.isTable params then return message.badTable!
      params.apps = _.enTable params.apps
      @apps = @@processAppsTable params.apps
      _.printTable @apps
      @layouts = _.enTable params.layouts
      return @


   processAppsTable: =>
      @apps = @@processAppsTable
      return @


   -- set: (keyName, value) =>

   -- Class ------------------------------------------------------------------
   @processAppsTable: (apps={}) ->
      apps = _.enTable apps
      if _.isEmpty apps then return {}

      _.map apps, (key, value) ->
         if _.isString value then value = { app: value }
         if not _.isTable value then return message.badTable!
         value.title = _.enString value.title, value.app
         return value

      return apps


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
