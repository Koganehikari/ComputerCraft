Robo = require('../robo')

oakLog = "minecraft:oak_log"

function pegarSapling()
    turtle.suckDown()
end

function detectarCortar()
    temBloco, info = turtle.inspect()
    if info.name == oakLog then
        return true
    end
end

function Madeira()    
        turtle.dig()
        turtle.forward()        
        repeat
            temBloco, info = turtle.inspectUp()
            if info.name == oakLog then
                turtle.digUp()
                turtle.up()
            end
        until info.name ~= oakLog
    while turtle.detectDown() == false do
        turtle.down()
    end
    turtle.back()
    Robo.selecionarSapling()
    turtle.place()
    Robo.selectItem(oakLog)
    turtle.refuel(2)
end

while true do
    pegarSapling()
    Robo.selectItem()
    if detectarCortar() == true then
        Madeira()
    end
    Robo.selectNotItem('minecraft:sapling')
    turtle.dropUp()
end