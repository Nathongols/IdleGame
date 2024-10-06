

--runs once at the start of the game (for setup)
function love.load()
    sprite=love.graphics.newImage("Women_idle_person_1.png")
    love.window.setTitle("ungabogga")
end

--runs every frame (for logic)
function love.update(dt)

end

--runs every frame (draws to screen) 
function love.draw()
    love.graphics.draw(sprite)
end