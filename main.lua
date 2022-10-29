WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

function love.load()
        love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
                fullscreen = false,
                resizable = false,
                vsync = true            -- vertical sync
        })
end

function love.draw()
        love.graphics.printf(
                "Hello World",          -- string
                0,                      -- start value of x (0 indicates left most)
                WINDOW_HEIGHT / 2 - 6,  -- start value of y
                WINDOW_WIDTH,           -- number of width to center things
                'center')               -- alignment mode
end