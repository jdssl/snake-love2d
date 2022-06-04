GameStates = { pause='pause', running='running', game_over='game over' }
State = GameStates.running
Tail_length = 0
Up = false
Down = false
Left = false
Right = false

local snake = { x = 15, y = 15 }
local direction = { x = 0, y = 0 }

local SIZE = 20
local apple = { x = 0, y = 0 }
local tail = {}

local function tail_increment()
  Tail_length = Tail_length + 1
end

local function new_apple_and_trail_incement()
  Add_apple()
  tail_increment()
  table.insert(tail, {0, 0})
end

function Add_apple()
  math.randomseed(os.time())

  apple.x = math.random(SIZE-1)
  apple.y = math.random(SIZE-1)
end

function Game_draw()
  -- snake's head
  love.graphics.setColor(0.8, 0.9, 0.0, 1.0)
  love.graphics.rectangle('fill', snake.x*SIZE, snake.y*SIZE, SIZE, SIZE)

  -- snake's tail
  love.graphics.setColor(0.6, 0.9, 0.0, 1.0)
  for _, value in ipairs(tail) do
    love.graphics.rectangle('fill', value[1]*SIZE, value[2]*SIZE, SIZE, SIZE)
  end

  -- apple
  love.graphics.setColor(1.0, 0.35, 0.4, 1.0)
  love.graphics.rectangle('fill', apple.x*SIZE, apple.y*SIZE, SIZE, SIZE, 15, 15)

  -- text
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print('collected apples: ' .. Tail_length, 10, 10, 0, 1.5, 1.5, 0, 0, 0, 0)
end

function Game_update()
  if Up and direction.y == 0 then
    direction.x, direction.y = 0, -1
  elseif Down and direction.y == 0 then
    direction.x, direction.y = 0, 1
  elseif Left and direction.x == 0 then
    direction.x, direction.y = -1, 0
  elseif Right and direction.x == 0 then
    direction.x, direction.y = 1, 0
  end

  local old = { x = snake.x, y = snake.y }

  snake.x = snake.x + direction.x
  snake.y = snake.y + direction.y

  local apple_captured = snake.x == apple.x and snake.y == apple.y

  if apple_captured then
    new_apple_and_trail_incement()
  end

  if snake.x < 0 then
    snake.x = SIZE - 1
  elseif snake.x > SIZE - 1 then
    snake.x = 0
  elseif snake.y < 0 then
    snake.y = SIZE - 1
  elseif snake.y > SIZE - 1 then
    snake.y = 0
  end

  if Tail_length > 0 then
    for _, value in ipairs(tail) do
      local x, y = value[1], value[2]
      value[1], value[2] = old.x, old.y
      old.x, old.y = x, y
    end
  end

  for _, value in ipairs(tail) do
    local snake_killed_itself = snake.x == value[1] and snake.y == value[2]

    if snake_killed_itself then
      State = GameStates.game_over
    end
  end
end

function Game_over_message()
  love.graphics.print("Game Over!", 100, 150, 0, 3, 3, 0, 0, 0, 0)
  love.graphics.print("Press Space to restart", 80, 250, 0, 2, 2, 0, 0 , 0, 0)
end

function Game_pause_mesage()
  love.graphics.print("Pause", 150, 150, 0, 3, 3, 0, 0, 0, 0)
  love.graphics.print("Press p to return the game", 40, 250, 0, 2, 2, 0, 0 , 0, 0)
end

function Game_restart()
  snake.x, snake.y = 15, 15
  direction.x, direction.y = 0, 0
  tail = {}
  Up, Down, Left, Right = false, false, false, false
  Tail_length = 0
  State = GameStates.running
  Add_apple()
end
