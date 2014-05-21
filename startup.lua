function console()
  local x, y = term.getSize()
  console = window.new( term.current(), x/2, y/2, x/2, y/2 )
  if showConsole then
    console.setVisible( true )
  else
    console.setVisible( false )
  end
  console.redraw()
end
function console.log( text )
  local x, y = console.getSize()
  for i = 1, #text / x, #text do
    console.write( text:sub(i, i * x)
  end
end

function main()
  console.clear()
  showConsole = true
  console()
  console.log( "started up")
end
