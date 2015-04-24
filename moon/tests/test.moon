_ = require "lua/utils/moses"
defaults = require "lua/utils/type-defaults"
message = require "lua/utils/message"
Reload = require "lua/reload"
Apps = require "lua/apps"


header = (text='') -> return ">> " .. text


describe header("#hammerspoon"), ->


   describe header("#moses"), ->


      describe header("#moses-extras"), ->


         it header("isPresent"), ->
            pulledDefaults = _.pull defaults, nil
            assert.is_false _.isPresent nil
            -- Check valid all valid launguage types: boolean, number, string, function, table
            _.each pulledDefaults, (key, value) ->
               assert.is_true _.isPresent value


      describe header("#moses-ensure"), ->

         defaultExamples = {
            nil: nil,
            boolean: true,
            number: 7,
            string: 'foo',
            function: -> return 'function'
            table: { foo: 'foo' }
         }

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


         -- it header("camelCase"), ->
         --    assert.is_same _.camelCase('foo bar'), 'fooBar'
         --    assert.is_same _.camelCase('foo bar, baz'), 'Foo Bar, Baz'


         it header("endsWith"), ->
            assert.is_same _.endsWith('foobar', 'bar'), true
            assert.is_same _.endsWith('foobar', 'rab'), false

