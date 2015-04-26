@rjhilgefort's Hammerspoon configuration
========================================

This is not your mama's standard .hammerspoon. I'm still fleshing out configuration strategies and features. Check back later for a pretty document (or poke around the source).


Installation
------------

- Install [Hammerspoon](http://www.hammerspoon.org/) (HS henceforth).
- Clone/Fork this repo to `~/.hammerspoon`
- Run `cd ~/.hammerspoon && ./scripts/compile.sh`
- Run HS. Or, tell HS to reload the config with: `hs.reload()` in the HS console


Development
-----------

There are a couple scripts in the `scripts/` directory that aid in development. Usually, I'll run `./scripts/compile.sh` when I first start working. I'll also immediately run `./scripts/watch.sh` and then forget about compiling alltogether. The `watch` script will automatically compile any moonscript changes to EXISTING FILES. If you make a new file, you'll need to restart the `watch` script


Poking Around The Source
------------------------

I decided to write this thing in Moonscript because Lua was very verbouse (and quirky). The actual project files are all contained within the 'moon' directory. There are tests in 'moon/tests', primarily as a way for me to test how moonscript/lua works (and make sure I get the expected output). There are utilities in the 'moon/utils' folder, but you shouldn't really need to be in there for anything- reading the primary files are pretty striaghtforward.

- `hammerfork.moon`: This is would be the exposed bits of the configuration to another user. It contains layout defenitions, application defenitions, etc.
- `config.moon`: This is the `hammerfork.moon` handler. Instantiating this object with the `hammerfork.moon` configuration gives you an instance that you can call layouts with/from.
- `reload.moon`: A simple reload class I wrote around the `hs.reload` methods.
- `main.moon`: The entrypoint for the application and where you'll set up 'binds' and other things (for now- I plan to move it).


Tests
-----

[Busted](http://olivinelabs.com/busted/) seemed to be the only viable testing framework for Lua. Running tests is as easy as:

```shell
busted ./moon/tests/test.moon
```
