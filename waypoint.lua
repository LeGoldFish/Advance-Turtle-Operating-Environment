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
  return pos
end
