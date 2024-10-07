-- Modules
local utils = require("utils")

local image = love.graphics.newImage("LugTread_Lite.png")

-- Load image once for all items
local images = {
    {image = image, x = 0, y = 0, width = image:getWidth(), height = image:getHeight()},
    {image = image, x = 0, y = 0, width = image:getWidth(), height = image:getHeight()},
    {image = image, x = 0, y = 0, width = image:getWidth(), height = image:getHeight()},
    {image = image, x = 0, y = 0, width = image:getWidth(), height = image:getHeight()},
    {image = image, x = 0, y = 0, width = image:getWidth(), height = image:getHeight()},
    {image = image, x = 0, y = 0, width = image:getWidth(), height = image:getHeight()}
}

-- Define items with position and size information
local items = {
    {name = "Lug", price = 1, quantity = 0, x = 0, y = 0, width = images[1].image:getWidth(), height = images[1].image:getHeight()},
    {name = "LugLite", price = 10, quantity = 0, x = 0, y = 0, width = images[2].image:getWidth(), height = images[2].image:getHeight()},
    {name = "LugPro", price = 20, quantity = 0, x = 0, y = 0, width = images[3].image:getWidth(), height = images[3].image:getHeight()},
    {name = "Luggy", price = 40, quantity = 0, x = 0, y = 0, width = images[4].image:getWidth(), height = images[4].image:getHeight()},
    {name = "LugBMX", price = 80, quantity = 0, x = 0, y = 0, width = images[5].image:getWidth(), height = images[5].image:getHeight()},
    {name = "LugCaffine", price = 90, quantity = 0, x = 0, y = 0, width = images[6].image:getWidth(), height = images[6].image:getHeight()}
}

local people = {
    -- Define any customer properties here in the future
}

function initShop()
    -- Initialize shop settings if needed
end

-- Function to buy an item
function buyItem(itemIndex)
    local item = items[itemIndex]
    if item.price <= ClickCounter then
        ClickCounter = ClickCounter - item.price
        item.quantity = item.quantity + 1
    end
end

-- Function to draw the shop
function drawShop()
    local xPosition = love.graphics.getWidth() - 250 -- Set the x-position on the right side
    local yPosition = 50 -- Starting y-position for the first item

    for i, item in ipairs(items) do
        item.x = xPosition
        item.y = yPosition
        images[i].x = item.x
        images[i].y = item.y
        -- Set color to blue for the background
        love.graphics.setColor(0, 0, 1, 0.5) -- RGBA (Red, Green, Blue, Alpha) with 0.5 opacity
        love.graphics.rectangle("fill", item.x, item.y, item.width, item.height)
        
        -- Reset color to white for the image
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(images[i].image, images[i].x, images[i].y, 0, 1)
        
        -- Draw item information below the image
        love.graphics.setColor(0, 0, 0)
        local itemText = item.name .. " - $" .. item.price .. " - Qty: " .. item.quantity
        love.graphics.print(itemText, item.x, item.y + item.height + 5)
        love.graphics.setColor(1, 1, 1)
        
        -- Increase y-position for the next item
        yPosition = yPosition + item.height + 30
    end
end

-- Function to detect mouse click
function ClickCheckShop(x, y, button, istouch, presses)
    if button == 1 then
        for i, Img in ipairs(images) do
            if IsMouseOverSprite(x,y,Img) then
                buyItem(i)
            end
        end
    end
end
