local oldturtle = {}

local pos = {x = 0, y = 0, z = 0, f = 0}
local origin = {x = 0, y = 0, z = 0, f = 0}
local tMap = {}

for k, v in pairs( turtle )
  oldturtle[k] = turtle[k]
end

local function turtle.save()
  local file = fs.open("turtle/origin", "w")
  file.writeLine(textutils.serialize(origin))
  file.close()
  local file = fs.open("turtle/pos", "w")
  file.writeLine(textutils.serialize(pos))
  file.close()
  local file = fs.open("turtle/tMap", "w")
  file.writeLine(textutils.serialize(tMap))
end

function turtle.load()
  local file = fs.open("turtle/origin", "r")
  origin = textutils.unserialize(file.readAll())
  file.close()
  local file = fs.open("turtle/pos"), "r")
  pos = textutils.unserialize(file.readAll())
  file.close()
  local file = fs.open("turtle/tMap", "r")
  tMap = textutils.unserialize(file.readAll())
end
  

function turtle.forward()
  if oldturtle.forward() then
    if pos.f == 0 then pos.x = pos.x + 1
    elseif pos.f == 1 then pos.y = pos.y + 1
    elseif pos.f == 2 then pos.x = pos.x - 1
    elseif pos.f == 3 then pos.y = pos.y - 1
    end
    turtle.save()
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
    turtle.save()
    return true
  else
   return false
  end
end

function turtle.up()
  if oldturtle.up() then
    pos.z = pos.z + 1
    return true
    turtle.save()
  else
    return false
  end
end

function turtle.down()
  if oldturtle.down() then
    pos.z = pos.z - 1
    return true
    turtle.save()
  else
    return false
  end
end

function turtle.turnRight()
  if oldturtle.turnRight() then
    pos.f = pos.f + 1
    if pos.f > 3 then
      pos.f = 0
    end
    turtle.save()
    return true
  else
    return false
  end
end

function turtle.turnLeft()
  if oldturtle.turnLeft() then
    pos.f = pos.f - 1
    if pos.f < 0 then
      pos.f = 3
    end
    turtle.save()
    return true
  else
    return false
  end
end

--function turtle.probe()
  --if turtle.detect() then
    --tMap[x[y[z]]] = true
  --end
--end

function turtle.setCurrentPos(x, y, z, f)
  origin.x = x - pos.x
  origin.y = y - pos.y
  origin.z = z - pos.z
  origin.f = f - pos.f
  if origin.f > 3 then
    origin.f = origin.f - 3
  end
  turtle.save()
end

function turtle.setOrigin(x, y, z, f)
  origin.x = x
  origin.y = y
  origin.z = z
  origin.f = f
  turtle.save()
end

function turtle.getCurrentPos()
  return origin.x + pos.x, origin.y + pos.y, origin.z + pos.z, pos.f
end

function turtle.getOrigin()
  return origin.x, origin.y, origin.z, origin.f
end

function turtle.select(num)
  oldselect = turtle.getSelected()
  oldturtle.select(num)
  return oldselect
end

function turtle.dig()
  if oldturtle.dig() then
    slot.update()
    return true
  else
    return false
  end
end

function turtle.digUp()
  if oldturtle.digUp() then
    slot.update()
    return true
  else
    return false
  end
end

function turtle.digDown()
  if oldturtle.digDown() then
    slot.update()
    return true
  else
    return false
  end
end

function turtle.place()
  if oldturtle.place() then
    slot.update()
    return true
  else
    return false
  end
end

function turtle.placeUp()
  if oldturtle.placeUp() then
    slot.update()
    return true
  else
    return false
  end
end

function turtle.placeDown()
  if turtle.placeDown() then
    slot.update()
    return true
  else
    return false
  end
end
