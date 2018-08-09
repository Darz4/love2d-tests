
--[[~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Globals
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~]]

buildingTypes =
{
    {
        name = "house",
        color = {1, 1, 1}
    },
    {
        name = "farm",
        color = {0.2, 1, 0.2},
    },
    {
        name = "military",
        color = {0.2, 0.2, 1}
    }
}
buildingTypeIndex = 1
entities = {}
cellSize = 30;
verbose = false;

--[[~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Love Events
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~]]

function love.load()
end

function love.keypressed(key, scancode, isrepeat)
    if isrepeat then return end

    if key == "space" then
        buildingTypeIndex = (buildingTypeIndex % #buildingTypes) + 1
    end
end

function love.mousereleased(x, y, button, istouch, presses)
    if button == 1 then
        local mouseX, mouseY = love.mouse.getPosition()
        local x = math.floor(mouseX / cellSize)
        local y = math.floor(mouseY / cellSize)
        local b = buildingTypes[buildingTypeIndex]
        table.insert(entities, { type = b.name, x = x, y = y })
        print("added entity: " .. b.name)
    elseif button == 2 then
        -- TODO: remove entity
    end
end

function love.update()
    local b = buildingTypes[buildingTypeIndex]
    
    if verbose then
        print("name: " .. b.name .. "  color: " .. b.color[1] .. "," .. b.color[2] .. "," .. b.color[3])
    end
end
    
function love.draw()
    for _,v in pairs(entities) do
        drawEntity(v)
    end

    local mouseX, mouseY = love.mouse.getPosition()
    local x = math.floor(mouseX / cellSize)
    local y = math.floor(mouseY / cellSize)
    local b = buildingTypes[buildingTypeIndex]
    love.graphics.setColor(b.color[1], b.color[2], b.color[3])
    love.graphics.rectangle("fill", x * cellSize, y * cellSize, cellSize, cellSize)
end

--[[~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Functions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~]]

function drawEntity(entity)
    for _,v in pairs(entities) do
        local b = getBuildingTypeByName(v.type)
        love.graphics.setColor(b.color[1], b.color[2], b.color[3])
        love.graphics.rectangle("fill", v.x * cellSize, v.y * cellSize, cellSize, cellSize)
    end

    love.graphics.setColor(1, 1, 1)
end

function getBuildingTypeByName(buildingTypeName)
    for _,v in pairs(buildingTypes) do
        if v.name == buildingTypeName then
            return v
        end
    end

    return nil
end