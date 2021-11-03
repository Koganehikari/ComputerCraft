local Robo = {}

function Robo.selectNotItem(nome)
    for i=1, 16 do
        local info = turtle.getItemDetail(i)
        if (not item or item.name ~= nome) then
            turtle.select(i)
            break
        end
    end
    return false
end

function Robo.selectItem(nome)
    for i=1, 16 do
        local info = turtle.getItemDetail(i)
        if (info and info.name == nome) then
            turtle.select(i)
            break
        end
    end
    return false
end

function Robo.selecionarSapling()
    local item = "minecraft:oak_sapling"
    for i=1, 16 do
        local info = turtle.getItemDetail(i)
        if (info and info.name == item) then
            turtle.select(i)
            break        
        end
    end
    return false
end

return Robo