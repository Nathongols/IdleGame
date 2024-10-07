ClickCounter = 0  -- Global counter for clicks

-- Lua Modules
local shop = require("shop")
local Button = require("Button")
local utils = require("utils")

-- Runs once at the start of the game (for setup)
function love.load()

   LoadLug()
   initShop()
   shader = love.graphics.newShader("2Dshader1.frag") 
end

-- Runs every frame (for logic)
function love.update(dt)
    local currentTime = love.timer.getTime() 
    shader:send("u_time", currentTime)
end

-- Runs every frame (draws to the screen)
function love.draw()
    love.graphics.setShader(shader)
    love.graphics.rectangle("fill", 0, 0, 800, 800)
    love.graphics.setShader()
    LugDraw()
    drawShop()
    -- Display the click counter
    
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Clicks: " .. ClickCounter, 10, 10)
    love.graphics.setColor(1, 1, 1)
end

function love.mousepressed(x, y, button, istouch, presses)
    ClickCheckButton(x, y, button, istouch, presses)
    ClickCheckShop(x, y, button, istouch, presses)
end
