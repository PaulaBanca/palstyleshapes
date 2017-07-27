local M={}
triangles=M

local display=display
local math=math
local print=print

local folderOfThisFile = (...):match("(.-)[^%.]+$")
local placer=require (folderOfThisFile.."placer")

setfenv(1,M)

local img=folderOfThisFile:sub(1,-2).."/img/palstyleshapes/triangle.png"
function create(w,h,max)
  local t=display.newImage(img)
  local mind=math.max(w/4,h/4)
  local mins=mind/t.width
  t:removeSelf()

  local function makeTriangles(x,y,w,h,angle)
    local t=display.newImage(img)
    local l=math.min(w,h)
    local s=math.max(mins,l/t.width)
    t:scale(s,s)
    t.rotation=angle
    t:setFillColor(0)
    t.x,t.y=x,y
    return t
  end

  return placer.create(w,h,max,makeTriangles)
end
return M