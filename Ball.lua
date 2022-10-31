Ball = class()
BALL_XSPPED = 150

function Ball:init(width, height)
        self.x = VIRTUAL_WIDTH / 2 - 2
        self.y = VIRTUAL_HEIGHT / 2 - 2
        self.width = width
        self.height = height

        self.dx = math.random(2) == 1 and BALL_XSPPED or -BALL_XSPPED
        self.dy = math.random(-50, 50)
end

function Ball:reset()
        self.x = VIRTUAL_WIDTH / 2 - 2
        self.y = VIRTUAL_HEIGHT / 2 - 2
        self.dx = math.random(2) == 1 and BALL_XSPPED or -BALL_XSPPED
        self.dy = math.random(-50, 50)
end

function Ball:draw()
        love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Ball:update(dt)
       self.x = self.x + dt * self.dx
       self.y = self.y + dt * self.dy
end