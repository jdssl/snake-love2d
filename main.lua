require('game')

function love.load()
  love.window.setPosition(500, 50, 1)
  Interval = 20
  Add_apple()
end

function love.draw()
  Game_draw()

  if State == GameStates.game_over then
    Game_over_message()
  end
end

function love.update()
  if State == GameStates.running then
    Interval = Interval - 1

    if Interval < 0 then
      Game_update()
      Interval = 20
    end
  end
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  elseif key == 'left' then
    Left, Right, Up, Down = true, false, false, false
  elseif key == 'right' then
    Left, Right, Up, Down = false, true, false, false
  elseif key == 'up' then
    Left, Right, Up, Down = false, false, true, false
  elseif key == 'down' then
    Left, Right, Up, Down = false, false, false, true
  elseif key == 'space' and State == GameStates.game_over then
    Game_restart()
  end
end
