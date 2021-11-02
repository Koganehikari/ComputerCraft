local function checkSlots()
  local curSlot = 1
  while turtle.getItemCount(curSlot) == 0 do curSlot = curSlot + 1 end

  turtle.select(curSlot)

  if curSlot == 16 then
    turtle.placeUp()
    turtle.select(1)
    for i=1,15 do turtle.suckUp() end
    turtle.select(16)
    turtle.digUp()
    turtle.select(1)
  end
end

local function place()
  checkSlots()
  turtle.placeDown()
end
