local M={}
palstyleshapes=M
local folderOfThisFile = (...):match("(.-)[^%.]+$")
local background=require (folderOfThisFile.."background")
local foreground=require (folderOfThisFile.."foreground")
local colourtools=require (folderOfThisFile.."colourtools")

local math=math
local display=display

setfenv(1,M)

local function setColours(colourIterator,g)
  for i=1, g.numChildren do
    if g[i].numChildren then
      setColours(colourIterator,g[i])
    elseif g[i].setFillColor then
      g[i]:setFillColor(colourIterator(1,1))
    elseif g[i].setStrokeColor then
      g[i]:setStrokeColor(colourIterator(1,1))
    end
  end
end

local size=200

function create(width,height)
  width=width or size
  height=height or size

  local group=display.newContainer(width,height)

  local colourIterator=colourtools.goldenRatioColourGenerator()
  local hasBg=math.random(2)==1
  if hasBg then
    local bg=background.create(colourIterator,width,height)
    group:insert(bg)
  end
  
  local fg=foreground.create(width,height)
  group:insert(fg)

  if not hasBg then  
    setColours(colourIterator,fg)
  end

  return group
end

return M
