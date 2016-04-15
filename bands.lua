local M={}
bands=M

local display=display
local math=math

setfenv(1,M)
local angles={0,45,90,180,225,270,315}

function create(w,h,max)
  max=max or math.huge
  local group=display.newGroup()
  local angle=angles[math.random(#angles)]

  local l=(w*w+h*h)^0.5
  local t=math.rad(angle+90)
  local dx,dy=math.cos(t),math.sin(t)
  local regular=math.random(4)<4

  local largestDimension=math.max(w,h)
  local rwidth=math.random(largestDimension/4)
  local rstep=rwidth+math.random(largestDimension/2)

  local x,y=-dx*l/2,-dy*l/2
  local outside=true
  while true do
    local width=regular and rwidth or math.random(largestDimension/4)
    local step=regular and rstep or width+math.random(largestDimension/2)
    
    if not outside then
      local hlength=l/2
      local line=display.newLine(group,x-dy*hlength,y+dx*hlength,x+dy*hlength,y-dx*hlength)
      line.strokeWidth=width
      line:setStrokeColor(0)
      if group.numChildren>max then
        return group
      end
    end
    x=x+dx*step
    y=y+dy*step

    if x<-w/2 or x>w/2 or y<-h/2 or y>h/2 then
      if not outside then
        break
      end
    else
      outside=false
    end
  end
  return group
end
return M