local chest = {

  addItem = function( self, nAmount, nSlot, sName )
    self.slot[nSlot].amount = self.slot[nSlot].amount + nAmount
    if not self.slot[nSlot].isKnown and sName then
      self.slot[nSlot] = sName
    end
  end,
  
  removeItem = function( self, nAmoun, nSlot )
    self.slot[nSlot].amount = self.slot[nSlot].amount - nAmount
    if self.slot[nSlot].amount == 0 then
      self.slot[nSlot].isKnown = false
    end
  end,
  
  save = function(self)
    local file = fs.open("turtle/chests/"..tostring(self))
    file.writeLine(textutils.serilize(self)
    file.close()
  end,
  
  load = function(self)
    local file = fs.open("turtle/chests/"..tostring(self))
    local data = file.readAll()
    self = textutils.unserialize(self)
    file.close()
  end,
  
}

function addChest( nSide )
  local coords = {turtle.getCurrentPos()}
  --find what side chest is on, do later
  setmetatable(coords, {__index = chest}
  return coords
end
