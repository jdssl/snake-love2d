local snakeX = 15
local snakeY = 15

function add_apple()
end

function game_draw()
  love.graphics.setColor(1.0, 0.35, 0.4, 1.0)
  love.graphics.rectangle('fill', snakeX*30, snakeY*30, 30, 30, 10, 10)
end

function game_update()
end

function game_restart()
end
