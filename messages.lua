function Game_over_message()
  love.graphics.printf(
    "Game Over - Press space to restart",
    0,
    200,
    love.graphics.getWidth(),
    "center"
  )
end

function Game_pause_mesage()
  love.graphics.printf(
    "Pause - Press p to return",
    0,
    200,
    love.graphics.getWidth(),
    "center"
  )
end
