entity = class:extend({
	-- class
	pool = {},
	
	extend = function(_ENV, tbl)
		tbl = class.extend(_ENV, tbl)
		return tbl
	end,

	each = function(_ENV, method, ...)
		for e in all(pool) do
			if (e[method]) e[method](e, ...)
		end
	end,
	
	-- instance
	x=0,
	y=0,

	w=8,
	h=8,

	init=function(_ENV)
		add(entity.pool, _ENV)
		if pool != entity.pool then
			add(pool, _ENV)
		end
	end,

	detect = function(_ENV, other, callback)
		if collide(_ENV, other) then
			callback(_ENV)
		end
	end,

	collide = function(_ENV, other)
		-- printh("Colision test: x:"..x.." y:"..y.." o.x:"..other.x.." o.y:"..other.y, "logs")
		return 
		x < other.x + other.w and x + w > other.x and 
		y < other.y + other.h and h + y > other.y
	end,

	destroy = function(_ENV)
		del(entity.pool, _ENV)
		if pool != entity.pool then
			del(pool, _ENV)
		end
	end
})