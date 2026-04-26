WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

push = require 'push'

function love.load()
    -- to fix the blurry effect on pixelated arts
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- seeding the random number generator with os.time make sure it starts a new every time the program runs
    math.randomseed(os.time())

    -- player scores
    playerOneScore = 0
    playerTwoScore = 0

    -- paddle positions 
    playerOneY = 10
    playerTwoY = VIRTUAL_HEIGHT - 40

    -- ball position 
    ballX = VIRTUAL_WIDTH / 2 - 2
    ballY = VIRTUAL_HEIGHT / 2 - 2

    ballDX = math.random(2) == 1 and 100 or -100
    ballDY = math.random(-50, 50)

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
            ballX = VIRTUAL_WIDTH / 2 - 2
            ballY = VIRTUAL_HEIGHT / 2 - 2

            ballDX = math.random(2) == 1 and 100 or -100
            ballDY = math.random(-50, 50) * 1.5
        end
    end 
end

function love.update(dt)
    if love.keyboard.isDown('w') then
        playerOneY = math.max(0, playerOneY + (-PADDLE_SPEED * dt))
    elseif love.keyboard.isDown('s') then
        playerOneY = math.min(VIRTUAL_HEIGHT - 30, playerOneY + (PADDLE_SPEED * dt))
    end

    if love.keyboard.isDown('up') then
        playerTwoY = math.max(0, playerTwoY + (-PADDLE_SPEED * dt))
    elseif love.keyboard.isDown('down') then
        playerTwoY = math.min(VIRTUAL_HEIGHT - 30, playerTwoY + (PADDLE_SPEED * dt))
    end

    if gameState == 'play' then
        ballX = ballX + (ballDX * dt)
        ballY = ballY + (ballDY * dt)
    end
end


function love.draw()
    push:start()
    love.graphics.clear(40/255, 45/255, 52/255, 1)

    -- drawing text 
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Welcome to Pong!' + tostring(gameState), 0, 8, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(largeFont)
    love.graphics.printf(tostring(playerOneScore), 0, 32, VIRTUAL_WIDTH / 2, 'center')
    love.graphics.printf(tostring(playerTwoScore), VIRTUAL_WIDTH / 2, 32, VIRTUAL_WIDTH / 2, 'center')

    -- paddle one  
    love.graphics.rectangle('fill', 10, playerOneY, 5, 30)
    -- paddle two  
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, playerTwoY, 5, 30)
    -- ball
    love.graphics.rectangle('fill', ballX, ballY, 4, 4)
    push:finish()
end