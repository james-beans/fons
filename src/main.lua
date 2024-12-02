-- Fons Engine
-- src/main.lua

-- This is the starting point/example of some components. You can use this just
-- change it a little bit and it might be a bit more like a tech demo so you will
-- need to add a bit more stuff for it to be actually good.

-- Update package.path to include the src/ec/base directory for module resolution
package.path = package.path .. ";src/ec/fons/base/?.lua"  -- Ensures Lua can find the modules in the base folder

-- Import the base module (located in src/ec/fons/base/)
---@diagnostic disable-next-line: different-requires
local fons = require("ec.fons.base.fonsbase")

-- Import the SFloorGrid module (located in src/ec/fons/objects/floorgrid/)
local SFloorGrid = require("ec.fons.objects.floorgrid.SFloorGrid")

-- Import the RCube module (located in src/ec/fons/objects/rcube/)
local RCube = require("ec.fons.objects.cubes.RCube")

-- Initialize the window
---@diagnostic disable-next-line: duplicate-set-field
function lovr.load()
  fons.init()                -- Initialize the base engine module
  SFloorGrid.lovrLoad()      -- Assuming SFloorGrid has a lovrLoad function
  RCube.addCube("assets/logos/1024x1024logodark.png", {0, 1.5, -2}, 1) -- cube
end

-- Draw and handle window updates
---@diagnostic disable-next-line: duplicate-set-field
function lovr.draw(pass)
  SFloorGrid.lovrDraw(pass)  -- Assuming SFloorGrid has a lovrDraw function
  RCube.lovrDraw(pass)       -- Draw the rotating cube
end
