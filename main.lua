push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

function love.load()
--[[ 	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true            -- vertical sync
	}) ]]
	love.graphics.setDefaultFilter('nearest', 'nearest')

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true            -- vertical sync
	})
end

function love.draw()
	push:apply('start')
	love.graphics.printf(
		"Hello World",          -- string
		0,                      -- start value of x (0 indicates left most)
		VIRTUAL_HEIGHT / 2 - 6,  -- start value of y
		VIRTUAL_WIDTH,           -- number of width to center things
		'center')               -- alignment mode
	push:apply('end')
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end
