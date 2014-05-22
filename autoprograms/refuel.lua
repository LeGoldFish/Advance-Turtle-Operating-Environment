while turtle.getFuelLevel < math.floor(turtle.getFuelLimit/2) do
  turtle.select(slot.fuel)
  turtle.refuel()
  end
end
