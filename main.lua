require('game')

function love.load()
  love.window.setPosition(500, 50, 1)
  interval = 20
end

function love.draw()
  game_draw()
end

function love.update()
  interval = interval - 1

  if interval < 0 then
    game_update()
    interval = 20
  end
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  elseif key == 'left' then
    left, right, up, down = true, false, false, false
  elseif key == 'right' then
    left, right, up, down = false, true, false, false
  elseif key == 'up' then
    left, right, up, down = false, false, true, false
  elseif key == 'down' then
    left, right, up, down = false, false, false, true
  end
end
