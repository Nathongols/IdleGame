function IsMouseOverSprite(mx, my, sprite)
    return mx >= sprite.x and mx <= sprite.x + sprite.width and
           my >= sprite.y and my <= sprite.y + sprite.height
end

