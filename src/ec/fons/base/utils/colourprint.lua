-- Fons Engine
-- src/ec/fons/base/utils/colourprint.lua

local colorprint = {}

-- Predefined color codes
colorprint.colors = {
    red = "31",
    green = "32",
    yellow = "33",
    blue = "34",
    magenta = "35",
    cyan = "36",
    white = "37",
    black = "30",
    default = "0",
    orange = "38;5;214"  -- (orange - light red in extended ANSI palette)
}

-- Function to print colored text with an optional newline
function colorprint.print(colorCode, text, newline)
    io.write("\27[" .. colorCode .. "m" .. text .. "\27[0m") -- Use io.write to avoid immediate newline
    if newline == nil or newline then  -- If newline is not provided or is true, add a newline
        print() 
    end
end

-- Convenience function to print text with predefined colors
function colorprint.red(text, newline)
    colorprint.print(colorprint.colors.red, text, newline)
end

function colorprint.green(text, newline)
    colorprint.print(colorprint.colors.green, text, newline)
end

function colorprint.yellow(text, newline)
    colorprint.print(colorprint.colors.yellow, text, newline)
end

function colorprint.blue(text, newline)
    colorprint.print(colorprint.colors.blue, text, newline)
end

function colorprint.magenta(text, newline)
    colorprint.print(colorprint.colors.magenta, text, newline)
end

function colorprint.cyan(text, newline)
    colorprint.print(colorprint.colors.cyan, text, newline)
end

function colorprint.white(text, newline)
    colorprint.print(colorprint.colors.white, text, newline)
end

function colorprint.default(text, newline)
    colorprint.print(colorprint.colors.default, text, newline)
end

function colorprint.orange(text, newline)
    colorprint.print(colorprint.colors.orange, text, newline)
end

return colorprint
