-- Fons Engine
-- src/ec/ImportGuide.lua

-- This is a tutorial for how to import in-engine components that came from the 
-- ec folder. See a list of components at the README.md file in the ec folder.

-- Update package.path to include the src/ec/ directory for module resolution
package.path = package.path .. ";src/ec/?.lua"  -- Ensures Lua can find the modules in the ec folder

-- Import the window init module (located in src/ec/fons/init/)
local wcfg = require("fons.init.wcfg")

-- Import the SFloorGrid module (located in src/ec/fons/objects/floorgrid/)
local SFloorGrid = require("fons.objects.floorgrid.SFloorGrid")

-- Initialize the window (this will set fullscreen mode)
function lovr.load()
  wcfg.load()       -- Initialize the window init module
  SFloorGrid.lovrLoad()  -- Assuming SFloorGrid has a lovrLoad function
end

-- Draw the SFloorGrid and handle window updates
function lovr.draw(pass)
  SFloorGrid.lovrDraw(pass)  -- Assuming SFloorGrid has a lovrDraw function
end
