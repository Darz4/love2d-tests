
cellSize = 30;

function love.update()
end
    
function love.draw()
    local mouseX, mouseY = love.mouse.getPosition()
    local x = math.floor(mouseX / cellSize) * cellSize
    local y = math.floor(mouseY / cellSize) * cellSize
    love.graphics.rectangle("fill", x, y, cellSize, cellSize)
end