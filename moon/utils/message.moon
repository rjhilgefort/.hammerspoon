_ = require "lua/utils/moses"

-- Helpers
generateMessageMethod = (genType='', hsAlert=false) ->
   resolver = {
      log: { level: 1, output: "LOG" },
      warn: { level: 2, output: "WARNING" },
      error: { level: 3, output: "ERROR" }
   }
   genType = resolver[genType]

   return (output='') ->
      output = "--> " .. genType.output .. ": " .. output

      if hsAlert then hs.alert output

      if genType.level >= 2 then output = "\n" .. output .. "\n"
      _.print output


-- `message` object (return object)
message = {}

message.log = generateMessageMethod('log')
message.warn = generateMessageMethod('warn')
message.error = generateMessageMethod('error')

message.alert = generateMessageMethod('warn', true)

-- TODO: Don't leave these here
-- TODO: Make a class of this `message` object and allow messages to be set on an instance
message.badTable = (identifier='', value) ->
   identifier = _.enString identifier
   if _.isEmpty identifier then identifier = '[unknown param]'
   if not _.isEmpty identifier then identifier = '"' .. identifier .. '"'

   message.error identifier .. " must be table: "
   _.print(value)


return message
