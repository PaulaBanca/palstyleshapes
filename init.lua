local M={}
init=M

local debug=debug
local require=require
local print=print
local package=package

setfenv(1,M)

function init()
  local fullpath=debug.getinfo(1,'S').source
  fullpath=fullpath:sub(2,-1)
  local last_slash_start=fullpath:find("/[^/]*$")
  local lua_subtree_path=fullpath:sub(1,last_slash_start-1)
  package.path=package.path..";"..lua_subtree_path.."/?.lua"
end
  
return M