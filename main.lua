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
    love.window.setTitle('Pong')

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
    if gameState == 'play' then
        -- ball bouncing off of paddles 
        if ball:collide(player1) then
            ball.dx = -ball.dx * 1.03 -- to make the ball go faster
            ball.x = player1.x + 5 -- width of ball + 1

            if ball.dy < 0 then
                ball.dy = -math.random(10, 150)
            else
                ball.dy = math.random(10, 150)
            end
        end

        if ball:collide(player2) then
            ball.dx = -ball.dx * 1.03 -- to make the ball go faster
            ball.x = player2.x - 4 -- just width of ball

            if ball.dy < 0 then
                ball.dy = -math.random(10, 150)
            else
                ball.dy = math.random(10, 150)
            end
        end
        
        -- ball bouncing off of walls 
        if ball.y <= 0 then
            ball.y = 0
            ball.dy = -ball.dy
        end

        if ball.y >= VIRTUAL_HEIGHT - 4 then
            ball.y = VIRTUAL_HEIGHT - 4
            ball.dy = -ball.dy
        end
    end


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

    displayFPS()

    push:finish()
end


function displayFPS()
    love.graphics.setFont(smallFont)
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 5)
    love.graphics.setColor(1, 1, 1, 1)
end