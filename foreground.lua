local M={}
foreground=M

local display=display
local math=math
local folderOfThisFile = (...):match("(.-)[^%.]+$")

local bands=require (folderOfThisFile.."bands")
local blocks=require (folderOfThisFile.."blocks")
local circles=require (folderOfThisFile.."circles")
local triangles=require (folderOfThisFile.."triangles")
local pentagons=require (folderOfThisFile.."pentagons")

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