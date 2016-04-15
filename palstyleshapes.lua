local M={}
palstyleshapes=M

require "background"
local background=background

require "foreground"
local foreground=foreground

require "colourtools"
local colourtools=colourtools

local math=math
local display=display

setfenv(1,M)

local colours=colourtools.goldenRatioColourGenerator()
local function setColours(g)
  for i=1, g.numChildren do
    if g[i].numChildren then
      setColours(g[i])
    elseif g[i].setFillColor then
      g[i]:setFillColor(colours(1,1))
    elseif g[i].setStrokeColor then
      g[i]:setStrokeColor(colours(1,1))
    end
  end
end

local size=200

function create(width,height)
  width=width or size
  height=height or size

  local group=display.newContainer(width,height)

  local hasBg=math.random(2)==1
  if hasBg then
    local bg=background.create(width,height)
    group:insert(bg)
  end
  
  local fg=foreground.create(width,height)
  group:insert(fg)

  if not hasBg then  
    setColours(fg)
  end

  return group
end

return M
