-- Fons Engine
-- src/ec/sfloorgrid/SFloorGrid.lua

-- Update package.path to include the src/ec/base directory for module resolution
package.path = package.path .. ";src/ec/fons/base/?.lua"  -- Ensures Lua can find the modules in the base folder

-- Import the base module (located in src/ec/fons/base/)
local fons = require("fons.base.fonsbase")

local colourprint = require('utils.colourprint')

local sfloorgrid = {}
local FloorDrawn = false

-- Define the load function that uses lovr
function sfloorgrid.lovrLoad()
    Shader = lovr.graphics.newShader([[
        vec4 lovrmain() {
            return DefaultPosition;
        }
    ]], [[
        const float gridSize = 25.;
        const float cellSize = .5;

        vec4 lovrmain() {
            vec2 uv = UV;

            // Distance-based alpha (1. at the middle, 0. at edges)
            float alpha = 1. - smoothstep(.15, .50, distance(uv, vec2(.5)));

            // Grid coordinate
            uv *= gridSize;
            uv /= cellSize;
            vec2 c = abs(fract(uv - .5) - .5) / fwidth(uv);
            float line = clamp(1. - min(c.x, c.y), 0., 1.);
            vec3 value = mix(vec3(.01, .01, .011), (vec3(.04)), line);

            return vec4(vec3(value), alpha);
        }
    ]], { flags = { highp = true } })

    lovr.graphics.setBackgroundColor(.05, .05, .05)
end

-- Define the draw function that uses lovr
function sfloorgrid.lovrDraw(pass)
    pass:setShader(Shader)
    pass:plane(0, 0, 0, 25, 25, -math.pi / 2, 1, 0, 0)

    if not FloorDrawn then
        colourprint.green("[!FONS ENGINE] ", false) colourprint.default("SFloorGrid drawn")
        FloorDrawn = true
    end
end

-- Return the sfloorgrid table so other files can use it
return sfloorgrid
