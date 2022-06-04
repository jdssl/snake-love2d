require('game')

function love.load()
  love.window.setPosition(500, 50, 1)
end

function love.draw()
  game_draw()
end

function love.update()
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
end
