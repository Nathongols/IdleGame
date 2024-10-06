local items = {
    {name = "Lug", price = 10, quantity = 0},
    {name = "LugLite", price = 20, quantity = 0},
    {name = "LugPro", price = 40, quantity = 0}
}

local people = {
    
}

function initShop()

end

function drawShop()
    local xPosition = love.graphics.getWidth() - 150 -- Set the x-position on the right side
    local yPosition = 50 -- Starting y-position for the first item

    -- Draw each item
    for i, item in ipairs(items) do
        -- Set item information
        local itemText = item.name .. " - Price: $" .. item.price .. " - Quantity: " .. item.quantity
        love.graphics.print(itemText, xPosition, yPosition)

        -- Increase y-position for the next item
        yPosition = yPosition + 30
    end
end