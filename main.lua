-- Define global variables for the sprite
local sprite = nil   -- Placeholder for the sprite image
local spriteX, spriteY = 0, 0  -- Initial position of the sprite
local spriteWidth, spriteHeight = 0, 0  -- Placeholder for sprite dimensions
local clickCounter = 0  -- Global counter for clicks
local scaleX, scaleY = 0.4, 0.4  -- Scale factors for the sprite

-- Lua Modules
local shop = require("shop")


-- Runs once at the start of the game (for setup)
function love.load()
    
    local windowWidth, windowHeight = love.graphics.getDimensions()
    -- Load the sprite image
    sprite = love.graphics.newImage("LUG.png")
    
    -- Get the width and height of the sprite
    spriteWidth = sprite:getWidth()*scaleX
    spriteHeight = sprite:getHeight()*scaleY

     -- Calculate the position to center the sprite
    spriteX = (windowWidth / 2) - (spriteWidth / 2)
    spriteY = (windowHeight / 2) - (spriteHeight / 2)
end

-- Runs every frame (for logic)
function love.update(dt)
    -- No update logic needed for now
end

-- Runs every frame (draws to the screen)
function love.draw()
    -- Draw the sprite at its position
    love.graphics.draw(sprite, spriteX, spriteY, 0, scaleX)
    drawShop()
    -- Display the click counter
    love.graphics.print("Clicks: " .. clickCounter, 10, 10)
end

function love.mousepressed(x, y, button, istouch, presses)
    -- Check if the mouse click was on the sprite
    if x >= spriteX and x <= spriteX + spriteWidth and
       y >= spriteY and y <= spriteY + spriteHeight then
        -- Increment the click counter
        clickCounter = clickCounter + 1
    end
end