function buildLine( xLen )
  turtle.up()
  for i = 1, xLen do
    turtle.forward()
    turtle.placeDown()
  end
  for i = 1, xLen do
    turtle.back()
  end
  turtle.down()
end

function buildWall( zHeight, xLen )
  for i = 1, zHeight do
    buildLine( xLen )
    turtle.up()
  end
  for i = 1, zHeight do
    turtle.down()
  end
end

function buildFloor( yLen, xLen )
  for i = 1, yLen do
    buildLine( xLen )
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
  end
  turtle.turnLeft()
  for i = 1, yLen do
    turtle.forward()
  end
end
