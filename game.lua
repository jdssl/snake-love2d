local snake = { x = 15, y = 15 }
local direction = { x = 0, y = 0 }

up = false
down = false
left = false
right = false

function add_apple()
end

function game_draw()
  love.graphics.setColor(1.0, 0.35, 0.4, 1.0)
  love.graphics.rectangle('fill', snake.x*30, snake.y*30, 30, 30, 10, 10)
end

function game_update()
  if up then
    -- directionX, directionY = 0, -1
    direction.x, direction.y = 0, -1
  elseif down then
    direction.x, direction.y = 0, 1
  elseif left then
    direction.x, direction.y = -1, 0
  elseif right then
    direction.x, direction.y = 1, 0
  end

  snake.x = snake.x + direction.x
  snake.y = snake.y + direction.y
end

function game_restart()
end
