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

function rightClick( x, y )
  local ox, oy = term.getCursoPos()
  term.setCursorPos( x, y )
  drawMenu.rightclick()
  term.setCursorPos( ox, oy )
end

DrawMenu = {
  file = function()
    term.setCursorPos(2, 2)
    term.write(" [Shutdown] ")
    clickmap.shutdown = {
      minx = 3,
      maxx = 12,
      miny = 2,
      maxy = 2,
      toggle = function() os.shutdown() end,
    }
    term.setCursrPos(2, 3)
    term.write(" [Restart] ")
    clickmap.restart = {
      minx = 3,
      maxx = 11,
      miny = 3,
      maxy = 3,
      toggle = function() os.reboot() end,
    }
    clickmap.file = nil
  end,
  run = function()
}


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
    toggle = function() drawMenu.file() end,
  }
  term.write(" [Run] ")
  clickmap.run = {
    minx = 10,
    maxx = 14,
    miny = 1,
    maxy = 1,
    toggle = function() drawMenu.run() end,
  }
  term.write(" [Edit] ")
  clickmap.edit = {
    minx = 17,
    maxx = 22,
    miny = 1,
    maxy = 1,
    toggle = function() drawMenu.edit() end,
  }
end

function clickCheck( event )
  if event[2] == 1 then
    for k, v in pairs( clickmap ) do
      if clickmap[k].maxx >= event[3] and clickmap[k].minx <= event[3] and clickmap[k].maxy >= event[4] and clickmap[k].miny >= event[4] then
        clickmap[k].toggle()
      end
    end
  else
    rightClick( event[3], event[4] )
  end
end
