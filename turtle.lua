local oldturtle = {}

local pos = {x = 0, y = 0, z = 0, f = 0}

for k, v in pairs( turtle )
  oldturtle[k] = turtle[k]
end

function turtle.forward()
  if oldturtle.forward() then
    if pos.f == 0 then pos.x = pos.x + 1
    elseif pos.f == 1 then pos.y = pos.y + 1
    elseif pos.f == 2 then pos.x = pos.x - 1
    elseif pos.f == 3 then pos.y = pos.y - 1
    end
    return true
  else
    return false
  end
end

function turtle.back()
  if oldturtle.back() then
    if pos.f == 0 then pos.x = pos.x - 1
    elseif pos.f == 1 then pos.y = pos.y - 1
    elseif pos.f == 2 then pos.x = pos.x + 1
    elseif pos.f == 3 then pos.y = pos.y + 1
    end
    return true
  else
   return false
  end
end

function turtle.up()
  if oldturtle.up() then
    pos.z = pos.z + 1
    return true
  else
    return false
  end
end

function turtle.down()
  if oldturtle.down() then
    pos.z = pos.z - 1
    return true
  else
    return false
  end
end

function turtle.turnRight()
  if oldturtle.turnRight() then
    turtle.f = turtle.f + 1
    if turtle.f > 3 then
      turtle.f = 0
    end
    return true
  else
    return false
  end
end

function turtle.turnLeft()
  if oldturtle.turnLeft() then
    turtle.f = turtle.f - 1
    if turtle.f < 0 then
      turtle.f = 3
    end
    return true
  else
    return false
  end
end
