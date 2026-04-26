WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

push = require 'push'
Class = require 'class'

require 'Paddle'
require 'Ball'

function love.load()
    -- to fix the blurry effect on pixelated arts
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- seeding the random number generator with os.time make sure it starts a new every time the program runs
    math.randomseed(os.time())

    -- player scores
    player1Score = 0
    player2Score = 0

    -- paddles 
    player1 = Paddle(10, 10, 5, 30)
    player2 = Paddle(VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 40, 5, 30)

    -- ball 
    ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

    -- setting game states
    gameState = 'start'

    -- setting fonts 
    largeFont = love.graphics.newFont('font.ttf', 32)
    mediumFont = love.graphics.newFont('font.ttf', 16)
    smallFont = love.graphics.newFont('font.ttf', 8)

    -- setting the window 
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        resizable = false,
        vsync = true,
        fullscreen = false
    })

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, { upscale = 'normal'})
end


function love.keypressed(key)
    -- check for escape action 
    if key == 'escape' then
        love.event.quit()

    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'play'
        else
            gameState = 'start'

            -- resetting the ball position 
            ball:reset()
        end
    end 
end

function love.update(dt)
    if love.keyboard.isDown('w') then
        player1.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown('s') then
        player1.dy = PADDLE_SPEED
    else
        player1.dy = 0
    end

    if love.keyboard.isDown('up') then
        player2.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown('down') then
        player2.dy = PADDLE_SPEED
    else
        player2.dy = 0
    end

    if gameState == 'play' then
        ball:update(dt)
    end

    player1:update(dt)
    player2:update(dt)
end


function love.draw()
    push:start()
    love.graphics.clear(40/255, 45/255, 52/255, 1)

    -- drawing text 
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Welcome to Pong!', 0, 8, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(largeFont)
    love.graphics.printf(tostring(player1Score), 0, 32, VIRTUAL_WIDTH / 2, 'center')
    love.graphics.printf(tostring(player2Score), VIRTUAL_WIDTH / 2, 32, VIRTUAL_WIDTH / 2, 'center')

    -- rendering objects
    -- paddle one  
    player1:render()
    -- paddle two  
    player2:render()
    -- ball
    ball:render()

    push:finish()
end