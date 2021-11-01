while (true) do
    turtle.forward()
    turtle.up()
    turtle.turnLeft()
    turtle.forward()
    turtle.down()
    turtle.turnLeft()
    turtle.forward()
    turtle.up()
    turtle.turnLeft()
    turtle.forward()
    turtle.down()
    turtle.turnLeft()
    if (turtle.getFuelLevel() == 0) then
        turtle.refuel(1)
            if (turtle.getItemCount() == 0) then
                break
            end
    end
end
