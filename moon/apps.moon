json= require "cjson"
_ = require "lua/utils/moses"
message = require "lua/utils/message"
-- Phandle = require "lua/utils/phandle"
-- appsJson = require "apps.json"

-- message.log appsJson
-- print json.decode()


class Apps
   -- Helpers ----------------------------------------------------------------
   processAppsTable = (apps={}) ->
      _.each(apps, (key, value) ->
          if _.isString value then value = { app: value }
          if not _.has value, 'app'
             message.error "`app` must be defined. Taking `key` (which is probably meaningless)"
             value.app = key
          if not _.has value, 'title' then value.title = value.app

          -- if _.isNumber(key)
          _.camelCaseify key

          -- assign new object
          apps[key] = value
      )

   -- Instance ---------------------------------------------------------------
   new: (params={}) =>
      if not _.isTable params then params = {}
      if not _.isString params.apps then params.apps = ''
      if not _.isString params.toLaunch then params.toLaunch = ''
      if not _.isString params.toKill then params.toKill = ''

      -- TODO: if apps is string and ends in json, read from there
      @apps = apps
      @toLaunch = {}
      @toKill = {}

   -- set: (keyName, value) =>

   -- Class ------------------------------------------------------------------
   @defaultAppsData: os.getenv "HOME" .. "/.hammerspoon/apps.json"

return Apps

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
