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
   if not _.isString obj then obj = defaults.string

   obj = obj\gsub "^%a", string.lower
   obj = obj\gsub "[%s%p]+(%w)", (match1) ->
	  if _.isString match1 then return match1\upper!
	  return obj\gsub "^(%a)", (match1) ->
		 return match1\lower!

   return obj

_.startsWith = (obj, value) ->
   if not _.isString obj then return false
   if not _.isString value then return false

   return obj\sub(1, value\len!) == value


_.endsWith = (obj, value) ->
   if not _.isString obj then return false
   if not _.isString value then return false

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
