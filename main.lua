WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

function love.load()
        love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
                full_screen = false,
                reizeable = false,
                vsync = true
        })
end

function love.draw()
        love.graphics.printf(
                "Hello World",
                0,
                WINDOW_WIDTH / 2 - 15,
                30,
                'center')
end