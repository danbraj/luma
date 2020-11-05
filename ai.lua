AI = {}

function AI:load()

  self.image = lg.newImage("graphics/p2.png")
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.x = lg.getWidth() - self.width - 50
  self.y = lg.getHeight() / 2
  self.speed = 500
  self.yVel = 0

  self.timer = 0
  self.rate = 0.33

end
  
function AI:update(dt)

  self:move(dt)
  self.timer = self.timer + dt
  if self.timer > self.rate then
    self.timer = 0
    self:acquireTarget()
  end

end

function AI:draw()

  love.graphics.draw(self.image, self.x, self.y)

end

function AI:move(dt)
  self.y = self.y + self.yVel * dt
end

function AI:acquireTarget()
  if Ball.y + Ball.height < self.y then
    self.yVel = -self.speed
  elseif Ball.y > self.y + self.height then
    self.yVel = self.speed
  else
    self.yVel = 0
  end
end