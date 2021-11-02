function digForward()
slotAtual = 2


function placeDown()
    turtle.select(slotAtual)
    turtle.placeDown()
    while (turtle.getItemCount(slotAtual) == 0 and slotAtual < 16) do
        slotAtual = slotAtual + 1
    end
end    
    
function digForward()
    while (turtle.detect()) do
        turtle.digDown()
        turtle.dig()
        placeDown()
    end
end

function refuel()
    turtle.select(1)
    turtle.refuel(1)
end

function Forward()
    if turtle.getFuelLevel() < 5 then
        refuel()
    end
    
    while turtle.forward() == false do
        turtle.attack()
        digForward()
    end 
end

while (true) do
    Forward()
end

    while (turtle.detect()) do
        turtle.digDown()
        turtle.dig()
    end
end

function refuel()
    turtle.select(1)
    turtle.refuel(1)
end

function Forward()
    if turtle.getFuelLevel() < 5 then
        refuel()
    end
    
    while turtle.forward() == false do
        turtle.attack()
        digForward()
    end 
end

while (true) do
    Forward()
end

