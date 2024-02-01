global = _ENV
noop = function()end

function _init()
    crashed = false
    speed = 0
    speed_up = .2
    scene:load(title_scene)
end

function _update()
    if (not crashed) then
        if (t() % 1 == 0) speed += speed_up
    end
    scene.current:update()
    entity:each("update")
end

function _draw()
    cls(13)
	scene.current:draw()
    entity:each("draw")
end