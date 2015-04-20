-- Helpers
generateMessageMethod = (genType='') ->
   resolver = {
      log: { level: 1, output: "LOG" },
      warn: { level: 2, output: "WARNING" },
      error: { level: 3, output: "ERROR" }
   }
   genType = resolver[genType]

   return (output='') ->
      output = "--> " .. genType.output .. ": " .. output
      if genType.level >= 2 then output = "\n" .. output .. "\n"
      print output


-- `message` object (return object)
message = {}

message.log = generateMessageMethod('log')
message.warn = generateMessageMethod('warn')
message.error = generateMessageMethod('error')

return message
