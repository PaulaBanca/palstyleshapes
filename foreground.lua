local M={}
foreground=M

local display=display
local math=math

require "bands"
local bands=bands

require "blocks"
local blocks=blocks

require "circles"
local circles=circles

require "triangles"
local triangles=triangles

require "pentagons"
local pentagons=pentagons

setfenv(1,M)

local createFuncs={
  bands.create,
  blocks.create,
  circles.create,
  triangles.create,
  pentagons.create,
}

function create(w,h)
  local numStyles=math.random(2)
  
  local group=display.newGroup()
  for i=1,numStyles do
    group:insert(createFuncs[math.random(#createFuncs)](w,h,8/numStyles))
  end

  return group
end

return M