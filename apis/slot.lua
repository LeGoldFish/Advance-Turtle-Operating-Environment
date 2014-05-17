local slots = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16}

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
}

create = function(num)
  slots[num] = {
    isKnown = false
    number = num
  }
  setmetatable(slots[num], fSlot)
  return slots[num]
end
