
buildingTypes =
{
    {
        name = house,
        color = {1, 1, 1}
    },
    {
        name = farm,
        color = {0.2, 1, 0.2},
    },
    {
        name = military,
        color = {0.2, 0.2, 1}
    }
}
buildingTypeIndex = 0
entities = {}
cellSize = 30;

function love.load()
    buildingTypeIndex = math.fmod(buildingTypeIndex + 1, #buildingTypes) + 1
    print(buildingTypeIndex .. " size=" .. #buildingTypes)
end

function love.keypressed(key, scancode, isrepeat)
    if isrepeat then return end

    if key == "space" then
        buildingTypeIndex = (buildingTypeIndex % #buildingTypes) + 1
        print(buildingTypeIndex .. " size=" .. #buildingTypes)
    end
end

function love.update()
end
    
function love.draw()
    local mouseX, mouseY = love.mouse.getPosition()
    local x = math.floor(mouseX / cellSize) * cellSize
    local y = math.floor(mouseY / cellSize) * cellSize
    local b = buildingTypes[buildingTypeIndex]
    love.graphics.setColor(b.color[1], b.color[2], b.color[3])
    love.graphics.rectangle("fill", x, y, cellSize, cellSize)
end