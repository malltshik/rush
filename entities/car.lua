car = entity:extend({

    x = 64,
    y = 64,

    w = 14,
    h = 16,
	
	speed = 1,
	flip = false,
	fire = 66,
	crashed = false,

    
    update = function(_ENV)
		if (btn(⬅️)) x-=speed
		if (btn(➡️)) x+=speed

		x = mid(18, x, 94)
		y = mid(6, y, 106)

        if (t() * 10) \ 1 % 4 == 0 then
			smoke({
				x = x + (flip and 4 or 9) + rnd(2),
				y = y + (flip and 0 or 16),
				frames=10+rnd(5),
			})
		end
		
		
		-- fire += .2
		-- if (fire >= 73) fire = 66
		fire = 66 + rnd(6)
		
    end,

    draw = function(_ENV)
        spr(1, x, y, 2, 2, false, flip)
		if (global.crashed) spr(fire, x + 4, y-6)
    end

})