Paddle = class()
PADDLE_SPEED = 200
PADDLE_HEIGHT = 50

function Paddle:init(x, y)
	self.x = x
	self.y = y
	self.score = 0
end

function Paddle:render()
	love.graphics.rectangle('fill', self.x, self.y, 3, PADDLE_HEIGHT)	-- rectangle on the left
end

function Paddle:update(dt, upKey, downKey)
	if love.keyboard.isDown(upKey) then
		self.y = math.max(0, self.y - PADDLE_SPEED * dt)
	end
	if love.keyboard.isDown(downKey) then
		self.y = math.min(VIRTUAL_HEIGHT - 50, self.y + PADDLE_SPEED * dt)
	end
end