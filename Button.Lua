local scaleX, scaleY = 0.4, 0.4  -- Scale factors for the sprite

local image = love.graphics.newImage("Luggy.png")

local sprite = {image = image, x = 0, y = 0, width = image:getWidth()*scaleX, height = image:getHeight()*scaleY}

function LoadLug()
    local windowWidth, windowHeight = love.graphics.getDimensions()

     -- Calculate the position to center the sprite
    sprite.x = (windowWidth / 2) - (sprite.width / 2)
    sprite.y = (windowHeight / 2) - (sprite.height / 2)
end

-- Runs every frame (draws to the screen)
function LugDraw()
    -- Draw the sprite at its position
    love.graphics.draw(sprite.image, sprite.x, sprite.y, 0, scaleX)
end

-- Check for mouse click events
function ClickCheckButton(x, y, button, istouch, presses)
    if button == 1 then -- Left mouse button
        if IsMouseOverSprite(x, y, sprite) then
            --Increase the click counter
            ClickCounter = ClickCounter + 1
        end
    end
end