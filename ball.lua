Ball = {}

function Ball:load()

  self.x = lg.getWidth() / 2
  self.y = lg.getHeight() / 2
  self.image = lg.newImage("graphics/ball.png")
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.speed = 350
  self.xVel = -self.speed
  self.yVel = 0

end
  
function Ball:update(dt)

  self:move(dt)
  self:collide()

end

function Ball:draw()

  lg.draw(self.image, self.x, self.y)

end

function Ball:move(dt)
  self.x = self.x + self.xVel * dt
  self.y = self.y + self.yVel * dt
end

function Ball:collide()

  if checkCollision(self, Player) then
    self.xVel = self.speed
    local middleBall = self.y + self.height / 2
    local middlePlayer = Player.y + Player.height / 2
    local collisionPosition = middleBall - middlePlayer
    self.yVel = collisionPosition * 5
  end
  
  if checkCollision(self, AI) then
    self.xVel = -self.speed
    local middleBall = self.y + self.height / 2
    local middleAI = AI.y + AI.height / 2
    local collisionPosition = middleBall - middleAI
    self.yVel = collisionPosition * 7
  end
  
  if self.y < 0 then
    self.y = 0
    self.yVel = -self.yVel
  elseif self.y + self.height > lg.getHeight() then
    self.y = lg.getHeight() - self.height
    self.yVel = -self.yVel
  end
  
  if self.x < 0 then
    Ball:begin(1)
    Score.ai = Score.ai + 1
  end
  
  if self.x + self.width > lg.getWidth() then
    Ball:begin(-1)
    Score.player = Score.player + 1
  end

end

function Ball:begin(direction)
  self.x = lg.getWidth() / 2 - self.width / 2
  self.y = lg.getHeight() / 2 - self.height / 2
  self.yVel = 0
  self.xVel = self.speed * direction
end
