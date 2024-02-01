grass = entity:extend({

    x = 64,
    y = 64,

    w = 8,
    h = 8,
    s = 0,

    init = function(_ENV)
        entity.init(_ENV)
        flip = rnd {true, false}
    end,
    
    update = function(_ENV)
        y += global.speed
        if (y > 128) destroy(_ENV)
    end,

    draw = function(_ENV)
        spr(s, x, y, 1, 1, flip, false)
    end

})

grass_decoration = entity:extend({

    init = function(_ENV)

        -- grass
		last_grass = nil
		for i=1,3 do
			grass({x = rnd{1, 7}, y = rnd(120), s = rnd{8,9,10,11}})
			grass({x = rnd{113, 119}, y = rnd(120), s = rnd{8,9,10,11}})
		end

        entity.init(_ENV)
    end,
    
    update = function(_ENV)
        if (not last_grass or last_grass.y > 15) then
			last_grass = grass({x = rnd{1, 7}, y = -8, s = rnd{8,9,10,11}})
			grass({x = rnd{113, 119}, y = -8, s = rnd{8,9,10,11}})
		end
    end

})