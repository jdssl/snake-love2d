local snakeX = 15
local snakeY = 15
local directionX = 0
local directionY = 0

up = false
down = false
left = false
right = false

function add_apple()
end

function game_draw()
  love.graphics.setColor(1.0, 0.35, 0.4, 1.0)
  love.graphics.rectangle('fill', snakeX*30, snakeY*30, 30, 30, 10, 10)
end

function game_update()
  if up then
    directionX, directionY = 0, -1
  elseif down then
    directionX, directionY = 0, 1
  elseif left then
    directionX, directionY = -1, 0
  elseif right then
    directionX, directionY = 1, 0
  end

  snakeX = snakeX + directionX
  snakeY = snakeY + directionY
end

function game_restart()
end
