local slots = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16}

if not fs.exists("turtle/inventory") and fs.isDir("turtle/inventory") then
  fs.makeDir("turtle/inventory")
end

function save()
  for i = 1, 16 do
    local file = fs.open("turtle/inventory/"..i, "w")
    file.writeLine(textutils.serialize(slots[i])
    file.close()
  end
end

function load()
  for i = 1, 16 do
    local file = fs.open("turtle/inventory/"..i, "r")
    slots[i] = file.readAll()
    file.close()
  end
end
  
fSlot = {
  isKnown = function(self)
    if self.info then
      return true
    else
      return false
    end
  end,
  getInfo = function(self) 
    return self.info 
  end
  update = function(self)
    oldselect = turtle.select(self.number)
    self.amount = turtle.getItemCount
    turtle.select(oldselect)
  end
}

create = function(num)
  slots[num] = {
    info = false
    number = num
  }
  setmetatable(slots[num], fSlot)
  return slots[num]
end

function fuel()
  for k, v in pairs(slots) do
    if v.isKnown() and v.isFuel then
      return k
    end
  end
end

function update()
  oldselect = turtle.getSelected()
  for i = 1, 16 do
    turtle.select(i)
    if turtle.getItemCount ~= slot[i].ammount then
      slot[i].update()
    end
  end
end
