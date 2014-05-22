local clickmap = {}

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
    console.write( text:sub( i, i + x ) )
  end
end

function main()
  console.clear()
  showConsole = true
  console()
  console.log( "started up")
end

function drawDesktop()
  local image = paintutils.loadImage(".images/desktop")
  paintutils.drawImage( image )
  term.setCursorPos(1, 1)
  term.setTextColor(colors.black)
  term.setBackgroundColor(colors.cyan)
  term.write(" [File] ")
  clickmap.file = {
    minx = 2,
    maxx = 9,
    miny = 1,
    maxy = 1,
    toggle = function() drawMenu.file end,
  }
  term.write(" [Run] ")
  clickmap.run = {
    minx = 10,
    maxx = 14,
    miny = 1,
    maxy = 1,
    toggle = function() drawMenu.run end,
  }
  term.write(" [Edit] ")
  clickmap.edit = {
    minx = 17,
    maxx = 22,
    miny = 1,
    maxy = 1,
    toggle = function() drawMenu.edit end,
  }
end

function clickCheck( event )
  for k, v in pairs( clickmap ) do
    if clickmap[k].maxx >= event[2] and clickmap[k].minx <= event[2] and clickmap[k].maxy >= event[3] and clickmap[k].miny >= event[3] then
      clickmap[k].toggle()
    end
  end
end
