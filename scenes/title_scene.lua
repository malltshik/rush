title_scene=scene:extend({

	init=function(_ENV)
		grass_decoration()
		white_line_decoration()
		title_car = car({x = 56, y = 80})
	end,

	update=function(_ENV)
		if (btnp(❎) or btnp(🅾️)) scene:load(game_scene)
		if(global.speed >= 10) global.speed = 10
	end,

	draw=function(_ENV)
		map()
		
		-- title
		print_title("rush", 35, 7)
		printc(ceil(speed * 100).."km/h", 50, 7)

		-- prompt
		print("❎/🅾️", 54, 106, 7)

		add(entity.pool, del(entity.pool, title_car))
	end
})