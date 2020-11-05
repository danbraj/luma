Player = {}

function Player:load()

  self.x = 50
  self.y = lg.getHeight() / 2
  self.speed = 500
  self.image = lg.newImage("graphics/p1.png")
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()

end
  
function Player:update(dt)

  self:move(dt)
  self:checkBoundaries()

end

function Player:draw()

  lg.draw(self.image, self.x, self.y)

end

function Player:move(dt)
  if love.keyboard.isDown("w") then
    self.y = self.y - self.speed * dt
  elseif love.keyboard.isDown("s") then
    self.y = self.y + self.speed * dt
  end
end

function Player:checkBoundaries()
  if self.y < 0 then
    self.y = 0
  elseif self.y + self.height > lg.getHeight() then
    self.y = lg.getHeight() - self.height
  end
end