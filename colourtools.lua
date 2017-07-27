local M={}
colourtools=M

local math=math
local assert=assert
local print=print
local system=system
local tonumber=tonumber

setfenv(1,M)

local floor=math.floor
local abs=math.abs

local maxCol=tonumber(system.getInfo("build"):sub(6))>2000 and 1 or 255

function HSVToRGB(h,s,v)
	local c=v*s
	local h=h/60
	local f=h-floor(h)
	local x=c*(1-abs(floor(h)%2 + f - 1))
	
	local r,g,b=0,0,0
	if h>=0 and h<1 then 
		r,g,b=c,x,0
	elseif h>=1 and h<2 then
		r,g,b=x,c,0
	elseif h>=2 and h<3 then
		r,g,b=0,c,x 
	elseif h>=3 and h<4 then
		r,g,b=0,x,c
	elseif h>=4 and h<5 then
		r,g,b=x,0,c
	elseif h>=5 and h<6 then
		r,g,b=c,0,x
	end

	local m=v-c
	return (r+m)*maxCol,(g+m)*maxCol,(b+m)*maxCol
end

function intervalColourGenerator(interval)
	local h=math.random(360)
	return function(s,v)
		h=h+interval
		h=h%360
		return HSVToRGB(h,s,v)
	end
end

function goldenRatioColourGenerator()
	local goldenRatio=0.618033988749895
	return intervalColourGenerator(goldenRatio*360)
end

function test()
	-- white
	local r,g,b=HSVToRGB(0,0,1)
	print (r .." " .. g .. " " .. b)
	assert (r==maxCol and g==maxCol and b==maxCol)
	-- black
	local r,g,b=HSVToRGB(0,0,0)
	print (r .." " .. g .. " " .. b)
	assert (r==0 and g==0 and b==0)

	-- red
	local r,g,b=HSVToRGB(0,1,1)
	print (r .." " .. g .. " " .. b)
	assert (r==maxCol and g==0 and b==0)
	-- green
	local r,g,b=HSVToRGB(120,1,1)
	print (r .." " .. g .. " " .. b)
	assert (r==0 and g==maxCol and b==0)
	-- blue
	local r,g,b=HSVToRGB(240,1,1)
	print (r .." " .. g .. " " .. b)
	assert (r==0 and g==0 and b==maxCol)

	-- yellow
	local r,g,b=HSVToRGB(60,1,1)
	print (r .." " .. g .. " " .. b)
	assert (r==maxCol and g==maxCol and b==0)
	-- magenta
	local r,g,b=HSVToRGB(300,1,1)
	print (r .." " .. g .. " " .. b)
	assert (r==maxCol and g==0 and b==maxCol)
	-- cyan
	local r,g,b=HSVToRGB(180,1,1)
	print (r .." " .. g .. " " .. b)
	assert (r==0 and g==maxCol and b==maxCol)

	local gen=goldenRatioColourGenerator()
	print (gen(0.9,0.2))
end

-- test()

return M