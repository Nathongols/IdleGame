
local clickCounter = 0  -- Global counter for clicks

-- Lua Modules
local shop = require("shop")
local Button = require("Button")

-- Runs once at the start of the game (for setup)
function love.load()
   LoadLug()
end

-- Runs every frame (for logic)
function love.update(dt)
    -- No update logic needed for now
end

-- Runs every frame (draws to the screen)
function love.draw()
    LugDraw()
    drawShop()
    -- Display the click counter
    love.graphics.print("Clicks: " .. clickCounter, 10, 10)
end
