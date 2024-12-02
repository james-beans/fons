-- Fons Engine
-- src/ec/floorgrid/RFloorGrid.lua

-- Update package.path to include the src/ec/base directory for module resolution
package.path = package.path .. ";src/ec/fons/base/?.lua"  -- Ensures Lua can find the modules in the base folder

-- Import the base module (located in src/ec/fons/base/)
local fons = require("fons.base.fonsbase")

local colourprint = require('utils.colourprint')

local RFloorGrid = {}
local FloorDrawn = false

function RFloorGrid.lovrLoad()
    lovr.graphics.setBackgroundColor(.05, .05, .05)
end

function RFloorGrid.lovrDraw(pass)
    pass:setColor(.1, .1, .12)
    pass:plane(0, 0, 0, 25, 25, -math.pi / 2, 1, 0, 0)
    pass:setColor(.2, .2, .2)
    pass:plane(0, 0, 0, 25, 25, -math.pi / 2, 1, 0, 0, 'line', 50, 50)

    if not FloorDrawn then
        colourprint.green("[!FONS ENGINE] ", false) colourprint.default("RFloorGrid drawn")
        FloorDrawn = true
    end
end

return RFloorGrid
