require("player")
require("ball")
require("ai")
require("background")

function love.load()

  -- Shortcuts
  lg = love.graphics
  lkid = love.keyboard.isDown
  font = love.graphics.newFont(36)

  -- Load
  Player:load()
  Ball:load()
  AI:load()
  Background:load()

  Score = {
    player = 0,
    ai = 0
  }

end

function love.update(dt)

  Player:update(dt)
  Ball:update(dt)
  AI:update(dt)
  Background:update(dt)

  if lkid('escape') then
    love.event.quit()
  end

end

function love.draw()

  Background:draw()
  Player:draw()
  Ball:draw()
  AI:draw()
  drawScore()
  displayFps()

end

function checkCollision(a, b)
  if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
    return true
  else
    return false
  end
end

function distanceBetween(x1, y1, x2, y2)
  return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end

function drawScore()
  love.graphics.setFont(font)
  love.graphics.print("Player: "..Score.player, 50, 50)
  love.graphics.print("AI: "..Score.ai, 1100, 50)
end

function displayFps()
  love.graphics.setFont(font)
  love.graphics.print('FPS: '..tostring(love.timer.getFPS()), 5, 5)
end