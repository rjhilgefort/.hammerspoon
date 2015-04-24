_ = require("moses")
defaults = require "lua/utils/type-defaults"


-------------------------------------------------------------------------------
-- STRINGS
-------------------------------------------------------------------------------

_.titleCase = (obj='') ->
   if not _.isString obj then obj = defaults.string
   return obj\gsub "(%a)([%w_']*)", (first, rest) ->
      return first\upper! .. rest\lower!


_.camelCase = (obj='') ->
   print obj


-- TODO: This is a stupid implementation of endsWith, use regex...
_.endsWith = (obj='', value) ->
   obj = _.enString obj
   value = _.enString value

   -- determine end
   valueLength = value\len()
   valueLength = valueLength * -1

   return obj\sub(valueLength) == value


-------------------------------------------------------------------------------
-- HELPERS
-------------------------------------------------------------------------------

generateEnsure = (genType='') ->
   isType = _['is' .. _.titleCase genType]

   return (obj, default) ->
      -- ensure default is present and valid
      if _.isNil default then default = defaults[genType]
      if not isType default then default = defaults[genType]

      if not isType obj then obj = default
      return obj


-------------------------------------------------------------------------------
-- EXTRAS
-------------------------------------------------------------------------------

-- Helper for a positive check (alias for not nil)
_.isPresent = (obj) ->
   return not _.isNil obj

-- Ensure methods
_.enString = generateEnsure 'string'
_.enTable = generateEnsure 'table'
_.enFunction = generateEnsure 'function'
_.enBoolean = generateEnsure 'boolean'
_.enNumber = generateEnsure 'number'
_.enNil = generateEnsure 'nil'
_.enPresent = (obj, default) ->
   if _.isNil obj then obj = default
   return obj

return _
