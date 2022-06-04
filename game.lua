local snake = { x = 15, y = 15 }
local direction = { x = 0, y = 0 }

local SIZE = 30
local apple = { x = 0, y = 0 }

Up = false
Down = false
Left = false
Right = false

function Add_apple()
  math.randomseed(os.time())

  apple.x = math.random(SIZE-1)
  apple.y = math.random(SIZE-1)
end

function Game_draw()
  -- snake
  love.graphics.setColor(0.8, 0.9, 0.0, 1.0)
  love.graphics.rectangle('fill', snake.x*SIZE, snake.y*SIZE, 30, 30, 10, 10)

  -- apple
  love.graphics.setColor(1.0, 0.35, 0.4, 1.0)
  love.graphics.rectangle('fill', apple.x*SIZE, apple.y*SIZE, 30, 30, 10, 10)
end

function Game_update()
  if Up then
    direction.x, direction.y = 0, -1
  elseif Down then
    direction.x, direction.y = 0, 1
  elseif Left then
    direction.x, direction.y = -1, 0
  elseif Right then
    direction.x, direction.y = 1, 0
  end

  snake.x = snake.x + direction.x
  snake.y = snake.y + direction.y
end

function Game_restart()
end
