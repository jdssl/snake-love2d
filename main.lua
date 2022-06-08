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

  if State == GameStates.pause then
    Game_pause_mesage()
  end
end

function love.update()
  if State == GameStates.running then
    Interval = Interval - 1

    if Interval < 0 then
      Game_update()
      if Tail_length <= 5 then
        Interval = 20
      elseif Tail_length > 5 and Tail_length <= 10 then
        Interval = 15
      elseif Tail_length > 10 and Tail_length <= 5 then
        Interval = 10
      else
        Interval = 5
      end
    end
  end
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  elseif key == 'left' and State == GameStates.running then
    Left, Right, Up, Down = true, false, false, false
  elseif key == 'right' and State == GameStates.running then
    Left, Right, Up, Down = false, true, false, false
  elseif key == 'up' and State == GameStates.running then
    Left, Right, Up, Down = false, false, true, false
  elseif key == 'down' and State == GameStates.running then
    Left, Right, Up, Down = false, false, false, true
  elseif key == 'space' and State == GameStates.game_over then
    Game_restart()
  elseif key == 'p' then
    if State == GameStates.running then
      State = GameStates.pause
    elseif State ~= GameStates.game_over then
      State = GameStates.running
    end
  end
end
