_ = require "lua/utils/moses"
defaults = require "lua/utils/type-defaults"
message = require "lua/utils/message"
Reload = require "lua/reload"
Apps = require "lua/apps"


-------------------------------------------------------------------------------
-- HELPERS
-------------------------------------------------------------------------------
header = (text='') -> return ">> " .. text


defaultExamples = {
   nil: nil,
   boolean: true,
   number: 7,
   string: 'foo',
   function: -> return 'function'
   table: { foo: 'foo' }
}


getOtherDefaults = (exclude) ->
   exclude = _.enString exclude

   otherDefaults = _.clone defaults
   otherDefaults[exclude] = nil

   return otherDefaults



-------------------------------------------------------------------------------
-- START TEST DEFS
-------------------------------------------------------------------------------
describe header("#hammerspoon"), ->


   describe header("#moses"), ->


      -- Because I don't trust Moses
      describe header("#moses-included"), ->


         it header("isString"), ->
            assert.is_true _.isString ''

            _.each getOtherDefaults('string'), (key, value) ->
               assert.is_false _.isString value


      describe header("#moses-extras"), ->


         it header("isPresent"), ->
            assert.is_false _.isPresent nil

            _.each getOtherDefaults('nil'), (key, value) ->
               assert.is_true _.isPresent value


      describe header("#moses-ensure"), ->

         -- Generate each of the tests for ensure methods
         _.each defaults, (defaultType, defaultValue) ->
            method = 'en' .. _.titleCase defaultType
            defaultExample = defaultExamples[defaultType]

            otherDefaults = _.clone defaults
            otherDefaults[defaultType] = nil

            it header(method), ->
               method = _[method]

               -- bare bones success case
               assert.is_same method(defaultExample), defaultExample
               assert.is_same method(defaultExample, defaultValue), defaultExample

               -- check all other types
               assert.is_same method(nil), defaultValue
               _.each otherDefaults, (otherType, otherValue) ->
                  assert.is_same method(otherValue), defaultValue
                  assert.is_same method(otherValue, defaultExample), defaultExample


      describe header("#moses-strings"), ->


         it header("titleCase"), ->
            assert.is_same _.titleCase('foo'), 'Foo'
            assert.is_same _.titleCase('foo bar, baz'), 'Foo Bar, Baz'
            assert.is_same _.titleCase('FOO bAr, bAZ'), 'Foo Bar, Baz'


         it header("camelCase"), ->
            assert.is_same _.camelCase('foo bar baz'), 'fooBarBaz'
            assert.is_same _.camelCase('Foo bar baz'), 'fooBarBaz'
            assert.is_same _.camelCase('foo-bar-baz'), 'fooBarBaz'
            assert.is_same _.camelCase('foo_bar_baz'), 'fooBarBaz'
            assert.is_same _.camelCase('foo-bar__baz'), 'fooBarBaz'
            assert.is_same _.camelCase('foo bar bazFoo'), 'fooBarBazFoo'
            assert.is_same _.camelCase('foo bar, baz'), 'fooBarBaz'
            assert.is_same _.camelCase('foo bar,._- baz'), 'fooBarBaz'


         it header("endsWith"), ->
            assert.is_same _.endsWith('foobar', 'bar'), true

            assert.is_same _.endsWith('foobar', 'foo'), false
            assert.is_same _.endsWith('foobar', 7), false
            assert.is_same _.endsWith('foobar', {}), false
            assert.is_same _.endsWith('foobar', ->), false
            assert.is_same _.endsWith('foobar', nil), false


         it header("startsWith"), ->
            assert.is_same _.startsWith('foobar', 'foo'), true

            assert.is_same _.startsWith('foobar', 'bar'), false
            assert.is_same _.startsWith('foobar', 7), false
            assert.is_same _.startsWith('foobar', {}), false
            assert.is_same _.startsWith('foobar', ->), false
            assert.is_same _.startsWith('foobar', nil), false

