-- Fons Engine
-- src/ec/fons/objects/cubes/RCube.lua

local RCube = {}
local cubes = {} -- Table to store cube data

-- Function to add a new cube with a specified texture
function RCube.addCube(texturePath, position, size)
    local cube = {
        texture = lovr.graphics.newTexture(texturePath),
        position = position or {0, 0, 0}, -- Default position if not provided
        size = size or 1, -- Default size if not provided
        angle = 0 -- Initial rotation angle
    }
    table.insert(cubes, cube)
end

-- Draw function to render all cubes
function RCube.lovrDraw(pass)
    for _, cube in ipairs(cubes) do
        -- Increment the rotation angle for each cube
        cube.angle = cube.angle + lovr.timer.getDelta()

        -- Set the cube's texture and render it
        pass:setMaterial(cube.texture)
        pass:cube(
            cube.position[1], cube.position[2], cube.position[3], -- Position
            cube.size, -- Size
            cube.angle, 0, 1, 0 -- Rotation (around Y-axis)
        )
    end
end

return RCube
