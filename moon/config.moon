_ = require "lua/utils/moses"
message = require "lua/utils/message"


class Config
   -- Helpers ----------------------------------------------------------------

   -- Instance ---------------------------------------------------------------
   new: (params) =>
      badTable = -> return message.error "`params` must be a well populated config table"

      -- TODO: if apps is string and ends in json, read from there
      -- if _.isString params then -- TODO: load config file on the fly from path (params)
      if not _.isTable params then return badTable!

      params.apps = _.enTable params.apps
      @apps = @@processAppsTable params.apps

      params.apps = _.enTable params.layouts
      @layouts = params.layouts


   processAppsTable: =>
      return @@processAppsTable @apps

   -- set: (keyName, value) =>

   -- Class ------------------------------------------------------------------
   @defaultAppsData: os.getenv "HOME" .. "/.hammerspoon/apps.json"

   @processAppsTable: (apps={}) ->
      if _.isEmpty apps then return {}

      _.each apps, (key, value) ->
         value = _.enTable value, { app: value }
         if not _.has value, 'app'
            message.error "`app` must be defined. Taking `key` (which is probably meaningless)"
            value.app = key
         if not _.has value, 'title' then value.title = value.app

         -- if _.isNumber(key)
         _.camelCase key

         -- assign new object
         apps[key] = value


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
