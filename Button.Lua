local sprite = nil   -- Placeholder for the sprite image
local spriteX, spriteY = 0, 0  -- Initial position of the sprite
local spriteWidth, spriteHeight = 0, 0  -- Placeholder for sprite dimensions
local scaleX, scaleY = 0.4, 0.4  -- Scale factors for the sprite

function LoadLug()
    local windowWidth, windowHeight = love.graphics.getDimensions()
    -- Load the sprite image
    sprite = love.graphics.newImage("Luggy.png")
    
    -- Get the width and height of the sprite
    spriteWidth = sprite:getWidth()*scaleX
    spriteHeight = sprite:getHeight()*scaleY

     -- Calculate the position to center the sprite
    spriteX = (windowWidth / 2) - (spriteWidth / 2)
    spriteY = (windowHeight / 2) - (spriteHeight / 2)
end

-- Runs every frame (draws to the screen)
function LugDraw()
    -- Draw the sprite at its position
    love.graphics.draw(sprite, spriteX, spriteY, 0, scaleX)
end

