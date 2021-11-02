function digForward()
    while (turtle.detect()) do
        turtle.digDown()
        turtle.dig()
    end
end

function refuel()
    turtle.select(16)
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

