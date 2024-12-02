-- Fons Engine
-- src/ec/init/fonsbase.lua

-- Update package.path to include the src/ec/ directory for module resolution
package.path = package.path .. ";src/ec/?.lua"  -- Ensures Lua can find the modules in the ec folder
package.path = package.path .. ";src/ec/fons/?.lua"  -- Ensures Lua can find the modules in the fons folder
package.path = package.path .. ";src/ec/fons/base/?.lua"  -- Ensures Lua can find the modules in the base folder
package.path = package.path .. ";src/ec/fons/objects/?.lua"  -- Ensures Lua can find the modules in the objects folder
package.path = package.path .. ";src/ec/fons/base/utils/?.lua"  -- Ensures Lua can find the modules in the utils folder

local colourprint = require('utils.colourprint')

local fonsbase = {}

local Graphics = lovr.graphics or {}

-- Helper function to check and apply fallback settings
  local function applyFallbackConfig()
    -- Retrieve the window title safely
    local windowTitle = Graphics.getTitle and Graphics.getTitle() or nil
    
    -- Check if the title is still the default ("LÖVR") and update it
    if windowTitle == "LÖVR" then
      colourprint.yellow("[!FONS ENGINE] ", false)
      colourprint.default("Default title detected. Updating to 'Fons Engine'...", false)
      if Graphics.setTitle then
        Graphics.setTitle("Fons Engine")
        colourprint.green("[!FONS ENGINE] ", false)
        colourprint.default("Window title updated successfully.", false)
      else
        colourprint.red("[!FONS ENGINE] ", false)
        colourprint.default("Error: Unable to update window title. lovr.graphics.setTitle is not available.", false)
      end
    elseif windowTitle then
      colourprint.yellow("[!FONS ENGINE] ", false)
      colourprint.default("Window title is already set to: " .. windowTitle, false)
    else
      colourprint.orange("[!FONS ENGINE] ", false)
      colourprint.default("Error: Unable to retrieve window title.", false)
    end
  end
  
  function fonsbase.init()
    colourprint.yellow("[!FONS ENGINE] ", false)
    colourprint.default("Checking if conf.lua configurations are applied...")
  
    -- Double-check configurations after LOVR has started
    lovr.timer.sleep(0.1) -- Small delay to ensure settings are initialized
    applyFallbackConfig()
  end
  
  return fonsbase
