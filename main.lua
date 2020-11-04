function love.load()

  button = {}
  button.x = 500
  button.y = 500
  button.size = 80

  score = 0
  timer = 0
  myFont = love.graphics.newFont(64)

end

function love.update(dt)

end

function love.draw()

  love.graphics.setColor(0, 0, 1)
  love.graphics.rectangle("fill", 100, 100, 200, 100)
  love.graphics.setColor(0, 1, 0)
  love.graphics.circle("line", 300, 200, 50)
  
  love.graphics.setColor(0.5, 0, 1)
  love.graphics.circle("fill", button.x, button.y, button.size)

  love.graphics.setFont(myFont)

  love.graphics.setColor(1, 1, .67)
  love.graphics.print(score)
  
  -- displayFps()

end

function love.mousepressed(x, y, b, istouch)

  if b == 1 then
    if distanceBetween(button.x, button.y, love.mouse.getX(), love.mouse.getY()) < button.size then
      score = score + 1
      -- button.x = math.random(0, love.graphics.getWidth())
      -- button.y = math.random(0, love.graphics.getHeight())
      button.x = math.random(button.size, love.graphics.getWidth() - button.size)
      button.y = math.random(button.size, love.graphics.getHeight() - button.size)
    end
  end
  
end

function distanceBetween(x1, y1, x2, y2)
  return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end

-- function displayFps()
--   love.graphics.setFont(love.graphics.newFont(20))
--   love.graphics.setColor(0, 1, 0)
--   love.graphics.print('FPS: '..tostring(love.timer.getFPS()), 5, 5)
-- end