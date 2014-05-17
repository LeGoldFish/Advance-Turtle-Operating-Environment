local waypoints = {}

function save()
  local file = fs.open("turtle/waypoints", "w")
  file.writeLine(textutils.serialize(waypoints))
  file.close()
end

function load()
  local file = fs.open("turtle/waypoints", "r")
  waypoints = file.readAll()
  file.close()
end

local options = {
  goto = function(self)
  --Add rest later
  if self.program then
    self.program()
  end
  getCoords = function(self)
    return self.x, self.y, self.z
  end
  addProgram = function(self, pName, cArgs)
    local file = fs.open('pName', "r")
    self.program = loadstring(file.readAll())
  end
}

function new()
  local x, y, z = turtle.getCurrentPos()
  pos = {x = x, y = y, z = z}
  setmetatable(pos, options)
  waypoints[#waypoints + 1] = pos
  save()
  return pos
end
