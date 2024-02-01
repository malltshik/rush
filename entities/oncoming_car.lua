oncoming_car = entity:extend({

	x = 64,
    y = 64,

    w = 0,
    h = 0,

    model = nil,
	flip = false,

    init = function(_ENV)
        model = rnd{
            {s = 19, sw = 2, sh = 2, w = 14, h = 16},
            {s = 21, sw = 2, sh = 2, w = 14, h = 16},
            {s = 23, sw = 2, sh = 2, w = 14, h = 16},
            {s = 25, sw = 2, sh = 2, w = 14, h = 16},
            {s = 27, sw = 2, sh = 4, w = 16, h = 32},
            {s = 29, sw = 2, sh = 4, w = 16, h = 32},
            {s = 64, sw = 2, sh = 8, w = 16, h = 64},
        }
        w = model.w
        h = model.h
        y = -model.h
        entity.init(_ENV)
    end,

	update = function(_ENV)
        y += global.speed
        if (y > 128) destroy(_ENV)
    end,
	
	draw = function(_ENV)
        spr(model.s, x, y, model.sw, model.sh, false, flip)        
    end

})

oncoming_car_logic = entity:extend({

    init = function(_ENV)
        global.oncoming_cars = {}
		last_oncoming_car_min_gap = 25
        entity.init(_ENV)
    end,

	update = function(_ENV)
        if (#global.oncoming_cars == 0 or global.oncoming_cars[#global.oncoming_cars].y > last_oncoming_car_min_gap + rnd(8)) then
			add(oncoming_cars, oncoming_car({x = rnd{22+rnd(5), 53+rnd(8), 86+rnd(5)}}))
		end
    end
    
})