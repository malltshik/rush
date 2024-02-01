white_line = entity:extend({

    x = 64,
    y = 64,

    l = 10,

    init = function(_ENV)
        entity.init(_ENV)
    end,
    
    update = function(_ENV)
        y += global.speed
        if (y > 128) destroy(_ENV)
    end,

    draw = function(_ENV)
        line(x, y, x, y + l, 7)
    end

})

white_line_decoration = entity:extend({

    init = function(_ENV)
		last_line = nil
		line_length = 10
		line_gap = 7
		line_f_x = 46
		line_s_x = 80
		for i=127, 0, -1 do
			if(i % (line_length + line_gap) == 0) then
				last_line = white_line({x = line_f_x, y = i, l = 10})
				white_line({x = line_s_x, y = i, l = 10})
			end
		end
        entity.init(_ENV)
	end,

    update = function(_ENV)
        if (not last_line or last_line.y > line_gap) then
			last_line = white_line({x = 46, y = -line_length})
			white_line({x = 80, y = -line_length})
		end
    end

})