Background = {}

function Background:load()
  self.universe = lg.newImage("graphics/universe.jpg")
  self.planets = lg.newImage("graphics/planets.png")
  self.width = self.planets:getWidth()
  self.height = self.planets:getHeight()
  self.rotation = 0
end
  
function Background:update(dt)
  self.rotation = self.rotation + 0.025 * dt
end
  
function Background:draw()
  lg.draw(self.universe, 0, 0)
  lg.draw(self.planets, self.width / 2, self.height / 2, self.rotation, 1, 1, self.width / 2, self.height / 2)
end