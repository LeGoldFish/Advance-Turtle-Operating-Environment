--[[
  This api will track the progress of your program, dependant on the way you use it
  ]]
  
local progress = {
  remove = function(self)
    fs.delete("turtle/progress/"..self.name)
  end
  checkpoint = function(self, num)
   local file = fs.open("turtle/progress/"..self.name, "w")
   fs.writeLine(num)
   file.close()
  end
}

function new()
  tablestuff = {
  name = shell.getRunningProgram()
  }
  setmetatable( tablestuff, {__index = progress})
  return tablestuff
end

function load( name, contents )
  if fs.exists("turtle/progress/"..name) then
    file = fs.open("turtle/progress/"..name, "r")
    file.close()
    local point = file.readAll()
    local start, end = contents:find(":checkpoint(%a+"..point.."%a+)")
    local result = contents:sub(end, #contents)
    return result
  end
end
