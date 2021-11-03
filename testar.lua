function selectItem(minecraft:cobblestone)
     for i = 1, 16 do
     local info = turtle.getItemDetail(i)
          if (info and info.name == name) then
             turtle.select(i)
             break
        end
    end
end

function refuel()
    local fuel = "minecraft:coal"
    for c = 1, 16 do
    local coal = turtle.getItemDetail(c)
        if (coal and coal.name == fuel) then
             turtle.select(c)
             turtle.refuel(1)
        end
    end
end

function move()
    if turtle.detectDown() then
          turtle.digDown()
    end
    selectItem(name)
    turtle.placeDown()
    if turtle.forward == false then
          turtle.dig()
          turtle.attack()
    end
end

while true do
    if selectItem(name) == true then
         move()
    else
       for i = length do
           turtle.back()
    end
    if turtle.getFuelLevel < 10 then
          refuel()
    end
end 