local M={}
background=M

local display=display
local math=math

local colourtools=require "colourtools"

setfenv(1,M)

local colours=colourtools.goldenRatioColourGenerator()

function create(w,h)
  local group=display.newGroup()
  local style=math.random(4)

  local hw,hh=w/2,h/2
  display.setDefault("anchorX",0)
  display.setDefault("anchorY",0)
  if style==1 then
    local r=display.newRect(group,-hw,-hh,w,h)
    r:setFillColor(colours(1,1))
  elseif style==2 then
    local r1=display.newRect(group,-hw,-hh,hw,h)
    local r2=display.newRect(group,0,-hh,hw,h)
    r1:setFillColor(colours(1,1))
    r2:setFillColor(colours(1,1))
  elseif style==3 then
    local r1=display.newRect(group,-hw,-hh,w,hh)
    local r2=display.newRect(group,-hw,0,w,hh)
    r1:setFillColor(colours(1,1))
    r2:setFillColor(colours(1,1))
  else
    local r1=display.newRect(group,-hw,-hh,hw,hh)
    local r2=display.newRect(group,-hw,0,hw,hh)
    local r3=display.newRect(group,0,-hh,hw,hh)
    local r4=display.newRect(group,0,0,hw,hh)
    local c1r,c1g,c1b=colours(1,1)
    local c2r,c2g,c2b=colours(1,1)
    
    r1:setFillColor(c1r,c1g,c1b)
    r2:setFillColor(c2r,c2g,c2b)
    r3:setFillColor(c2r,c2g,c2b)
    r4:setFillColor(c1r,c1g,c1b)
  end
  display.setDefault("anchorX",0.5)
  display.setDefault("anchorY",0.5)

  return group

end

return M