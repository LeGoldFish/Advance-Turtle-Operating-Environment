local options = {
  goto = function(self)
  --Add rest later
  end
  getCoords = function(self)
    return self.x, self.y, self.z
  end
}

function new()
  local x, y, z = turtle.getCurrentPos()
  pos = {x = x, y = y, z = z}
  setmetatable(pos, options)
  return pos
end
