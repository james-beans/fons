# fons
A game engine written in [LUA](https://en.wikipedia.org/wiki/Lua_(programming_language)) using [LÖVR](https://github.com/bjornbytes/lovr).

## Documentation:

### Getting Started:
1. To get started you need to make a project. Make a project by cloning (`git clone https://github.com/james-beans/fons.git`) or [forking this repo](https://github.com/james-beans/fons/fork).
2. Then open [the src folder](/src/) and run `lovr main.lua`. This is the base template.
3. Use the components in [the ec folder](/src/ec/) to change and make anenvironment.

### Using the components:
You need to import the main libraries to use a component. If you are using an engine template then you will not need to import anything in the existing files.

You will need to import the main libraries in the `main.lua` file but if in a seperate module not all cases needs it to be imported.
When importing in the `main.lua` file you will need the `conf.lua` file in the same dir and another piece of code to put everything together.

To import the main libraries add the following code to a file:

```
-- Update package.path to include the base path
package.path = package.path .. ";src/ec/fons/base/?.lua"

-- Import the base module (located in src/ec/fons/base/)
local fons = require("fons.base.fonsbase")

-- **REST OF THE CODE HERE**
```

To make the `main.lua` file work you need this code under the imports:

```
-- Initialize the window
---@diagnostic disable-next-line: duplicate-set-field
function lovr.load()
  fons.init()                -- Initialize the base engine module
end

-- Draw and handle window updates
---@diagnostic disable-next-line: duplicate-set-field
function lovr.draw(pass)
  -- ** COMPONENTS CAN BE IMPORTED AND USED HERE!**
end
```

You can get a [list of components from the ec/readme.md file](/src/ec/README.md). This list will always be updated with latest components.

## Disclamer:
- I will not be supporting MacOS. It might work but I will not add it at all.
- The Github Wiki feature will not be used at all. You will find the docs from this file or the official website (coming soon maybe).
- Documentation will not be made for any component apart from the name, already made projects using the said component and the components code itself.
- You will need to figure out a way to add things yourself after reading [the lövr documentation](https://lovr.org) and this documentation.
- I recommend to look through [the list of components from the ec/readme.md file](/src/ec/README.md) before making your own components.
    - For example don't make your own coloured-text printing, use [the colourprint.lua component](/src/ec/fons/base/utils/colourprint.lua).
