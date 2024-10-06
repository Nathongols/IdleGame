-- Define global variables for the sprite
local sprite = nil   -- Placeholder for the sprite image
local spriteX, spriteY = 0, 0  -- Initial position of the sprite
local spriteWidth, spriteHeight = 0, 0  -- Placeholder for sprite dimensions
local clickCounter = 0  -- Global counter for clicks

-- Runs once at the start of the game (for setup)
function love.load()
    local windowWidth, windowHeight = love.graphics.getDimensions()
    -- Load the sprite image
    sprite = love.graphics.newImage("LUG.png")
    
    -- Get the width and height of the sprite
    spriteWidth = sprite:getWidth()*0.4
    spriteHeight = sprite:getHeight()*0.4

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
    love.graphics.draw(sprite, spriteX, spriteY, 0, 0.4)
    
    -- Display the click counter
    love.graphics.print("Clicks: " .. clickCounter, 10, 10)
end
