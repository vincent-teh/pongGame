push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200
BALL_XSPPED = 150

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

        player1Score = 0
        player2Score = 0

        player1Y = 40
        player2Y = VIRTUAL_HEIGHT -  40 - 50

        ballX = VIRTUAL_WIDTH / 2 - 2
        ballY = VIRTUAL_HEIGHT / 2 - 2

        ballDX = math.random(2) == 1 and BALL_XSPPED or -BALL_XSPPED
        ballDY = math.random(-50, 50)

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
        love.graphics.rectangle('fill', 20, player1Y, 3, 50)	-- rectangle on the left
        love.graphics.rectangle('fill',
                                VIRTUAL_WIDTH - 20 - 3,
                                player2Y,
                                3, 50)			-- rectangle on the right
        love.graphics.rectangle('fill', ballX, ballY , 4, 4)

        love.graphics.setNewFont(8)
        love.graphics.printf("Player 1: " .. player1Score, 70, 20, VIRTUAL_WIDTH, 'left')
        love.graphics.printf("Player 2: " .. player2Score, -70, 20, VIRTUAL_WIDTH, 'right')
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
        if love.keyboard.isDown('w') then
                player1Y = math.max(0, player1Y - PADDLE_SPEED * dt)
        end
        if love.keyboard.isDown('s') then
                player1Y = math.min(VIRTUAL_HEIGHT - 50, player1Y + PADDLE_SPEED * dt)
        end
        if love.keyboard.isDown('up') then
                player2Y = math.max(0, player2Y - PADDLE_SPEED * dt)
        end
        if love.keyboard.isDown('down') then
                player2Y = math.min(VIRTUAL_HEIGHT - 50, player2Y + PADDLE_SPEED * dt)
        end
        if gameState == 'play' then
                ballX = ballX + ballDX * dt
                ballY = ballY + ballDY * dt
        end
end