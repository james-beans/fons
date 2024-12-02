-- Fons Engine
-- src/ec/init/wcfg.lua

local wcfg = {}

function wcfg.load()
  -- Set the window to fullscreen
  lovr.window.setMode(0, 0, {fullscreen = true})

  -- Set the window title to "Fons Engine"
  lovr.window.setTitle("Fons Engine")
end

return wcfg