_ = require("moses")
defaults = require "lua/utils/type-defaults"


-------------------------------------------------------------------------------
-- EXTRAS
-------------------------------------------------------------------------------

generateEnsure = (genType='') ->
   return (obj, default) ->
      print genType
      print defaults[genType]
      if _.isNil default then default = defaults[genType]
      print default
      if not _['is' .. _.titleCase(genType)] obj then obj = default
      print default
      return obj


-------------------------------------------------------------------------------
-- EXTRAS
-------------------------------------------------------------------------------

_.isPresent = (obj) ->
   return not _.isNil obj

_.enString = generateEnsure 'string'
_.enTable = generateEnsure 'table'
_.enFunction = generateEnsure 'function'

-------------------------------------------------------------------------------
-- STRINGS
-------------------------------------------------------------------------------

_.titleCase = (obj) ->
   _.enString obj
   return obj

_.camelCase = (obj='') ->
   print obj

return _
