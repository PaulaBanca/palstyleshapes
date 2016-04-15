local M={}
placer=M

local display=display
local math=math

setfenv(1,M)

local angles={0,45,90,180,225,270,315}

function create(w,h,max,makeShape)
  max=max or math.huge
  local group=display.newGroup()
  
  local regular=math.random(4)<3

  local largestDimension=math.max(w,h)
  local num=math.random(max)
  local maxSize=largestDimension/(num*1.4)
  local square=math.random(2)==1
  local rw=math.random(maxSize)
  local rh=square and rw or math.random(maxSize)
  local rangle=angles[math.random(#angles)]
  
  local reflect=math.random(6)

  for i=1, num do
    if group.numChildren>=max then
      return group
    end
    local bw=regular and rw or math.random(maxSize)
    local bh=square and bw or (regular and rh or math.random(maxSize))
    local angle=regular and rangle or angles[math.random(#angles)]
    local x,y=math.random(w)-w/2,math.random(h)-h/2
    
    group:insert(makeShape(x,y,bw,bh,angle))
    
    if reflect==1 or reflect==3 then
      group:insert(makeShape(x*-1,y,bw,bh,angle))
    end
    if reflect==2 or reflect==3 then
      group:insert(makeShape(x,y*-1,bw,bh,angle))
    end
    if reflect==3 or reflect==4 then
      group:insert(makeShape(x*-1,y*-1,bw,bh,angle))
    end      
  end
  return group
end
return M