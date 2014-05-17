while true do
  if turtle.getFuelLevel < math.floor(turtle.getFuelLimit/2) then
    turtle.select(slot.fuel)
    turtle.refuel()
  end
end
