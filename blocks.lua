local M={}
blocks=M

local display=display
local math=math

require "placer"
local placer=placer

setfenv(1,M)

function create(w,h,max)
  local minw,minh=w/4,h/4
  local function makeBlock(x,y,w,h,angle)
    local r=display.newRect(0,0,math.max(minw,w),math.max(minh,h))
    r.rotation=angle
    r:setFillColor(0)
    r.x,r.y=x,y
    return r
  end

  return placer.create(w,h,max,makeBlock)
end
return M