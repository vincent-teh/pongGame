push = require 'push'
require 'class'

require 'Ball'
require 'Paddle'

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
        math.randomseed(os.time())

        love.graphics.setDefaultFilter('nearest', 'nearest')
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true            -- vertical sync
	})

        player1 = Paddle(20, 40)
        player2 = Paddle(VIRTUAL_WIDTH - 20 - 3, VIRTUAL_HEIGHT -  40 - 50)

        ball = Ball(4, 4)

        gameState = 'start'
end

function love.draw()
        love.graphics.clear(40/255, 45/255, 52/255, 1)
        push:apply('start')
        love.graphics.setNewFont(12)
        love.graphics.printf(
                "Pong Game",          -- string
                0,                      -- start value of x (0 indicates left most)
                20,  -- start value of y
                VIRTUAL_WIDTH,           -- number of width to center things
                'center')               -- alignment mode
        -- love.graphics.rectangle('fill', 20, player1Y, 3, 50)	-- rectangle on the left
        player1:render()
        --[[ love.graphics.rectangle('fill',
                                VIRTUAL_WIDTH - 20 - 3,
                                player2Y,
                                3, 50)			-- rectangle on the right
]]
        player2:render()
        ball:draw()

        love.graphics.setNewFont(8)
        love.graphics.printf("Player 1: " .. player1.score, 70, 20, VIRTUAL_WIDTH, 'left')
        love.graphics.printf("Player 2: " .. player2.score, -70, 20, VIRTUAL_WIDTH, 'right')
        push:apply('end')
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
        if key == 'enter' or key == 'return' then
                if gameState == 'start' then
                        gameState = 'play'
                else
                        gameState = 'start'
                end
	end
end

function love.update(dt)
        player1:update(dt, 'w', 's')
        player2:update(dt, 'up', 'down')
        if gameState == 'play' then
                ball:update(dt)
        end
end