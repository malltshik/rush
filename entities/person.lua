person=entity:extend({
	x=60,
	y=63,
    w=16,
    h=16,

	dx=0,
	dy=0,

	speed=3,
    col=7,

	update=function(_ENV)
		dx,dy=0,0

		if (btn(⬆️)) dy-=1
		if (btn(⬇️)) dy+=1
		if (btn(⬅️)) dx-=1
        if (btn(➡️)) dx+=1

		if dx != 0 or dy != 0 then
			local a=atan2(dx, dy)
			x+=cos(a)
			y+=sin(a)
		end
		
		-- restrict movement
		x=mid(7,x,114)
		y=mid(15,y,116)		
	end,

	draw=function(_ENV)
        print("웃", x, y, col)
	end,
})