local M={}
circles=M

local display=display
local math=math
local print=print
local folderOfThisFile = (...):match("(.-)[^%.]+$")
local placer=require (folderOfThisFile.."placer")

setfenv(1,M)

function create(w,h,max)
  local minr=math.max(w/4,h/4)/2
  local function makeCircle(x,y,w,h,angle)
    local r=display.newCircle(0,0,math.max(minr,math.max(w,h)/2))
    r.rotation=angle
    r:setFillColor(0)
    r.x,r.y=x,y
    return r
  end

  return placer.create(w,h,max,makeCircle)
end
return M