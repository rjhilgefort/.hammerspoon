_ = require "lua/utils/moses"
defaults = require "lua/utils/type-defaults"

class Phandle
   -- Helpers ----------------------------------------------------------------
   generateEnsure = (genType='') ->
      return (params={}, ns, default) ->
         if not _.isTable params then params = {}

         if not _.has params, default then default = defaults[genType]
         if not _.has params, ns then params[ns] = default

         return params

   -- Instance ---------------------------------------------------------------

   -- Class ------------------------------------------------------------------
   @ensureString: generateEnsure 'string'
   @ensureTable: generateEnsure 'table'
   @ensureFunction: generateEnsure 'function'

return Phandle
