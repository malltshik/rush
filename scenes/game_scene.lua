game_scene=scene:extend({

	init=function(_ENV)
		-- player
		global.speed = 1
		global.max_speed = global.speed
		global.player = car({x = 56, y = 100, speed = 4})
		global.crashed = false

		grass_decoration()
		white_line_decoration()
		oncoming_car_logic()
	end,

	update=function(_ENV)
		if(not global.crashed) then
			global.max_speed = global.speed
			sfx(1, 1, min(global.speed, 31), 1)
			crash_check(_ENV)
		end

		if (global.crashed) then
			if (btnp(❎) or btnp(🅾️)) then
				scene:load(game_scene)
			end
		end

		
	end,

	draw = function(_ENV)
		map()
		add(entity.pool, del(entity.pool, player))
	end,
	
	crash_check = function(_ENV)
		for c in all(global.oncoming_cars) do
			c:detect(player, function() 
				sfx(-1, 1)
				sfx(0)
				global.crashed = true
				global.speed = 0
				global.player.speed = 0
				crashed_label()
			end)
		end
	end
})



crashed_label = entity:extend({
	draw = function(_ENV) 
		print_title("crashed", 26, 7)
		printc(ceil(global.max_speed * 100) - 50 .. "km/h", 40, 7)
		print("❎/🅾️", 54, 50, 7)
	end
})




