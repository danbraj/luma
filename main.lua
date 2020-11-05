require("background")

function love.load()

  -- Shortcuts
  lg = love.graphics
  lkid = love.keyboard.isDown

  -- Objects
  spaceship = {
    x = 600,
    y = 400,
    moveSpeed = 250,
    bullets = {},
    bulletSpeed = 350,
    bulletShootingRate = 0.5,
    bulletShootingTime = 0
  }

  -- Assets
  spaceshipDefault = lg.newImage("graphics/default.png")
  spaceshipDefault:setFilter("nearest", "nearest")
  bullet = lg.newImage("graphics/bullet.png")
  bullet:setFilter("nearest", "nearest")
  enemy = lg.newImage("graphics/enemy.png")
  enemy:setFilter("nearest", "nearest")

  -- Enemy
  enemies = {}
  enemySpeed = 90
  enemyTimer = 0
  enemySpawnRate = 1.25

  -- Randomseed
  math.randomseed(os.time())

  -- Background
  Background:load()

end

function love.update(dt)

  -- Timer
  spaceship.bulletShootingTime = spaceship.bulletShootingTime + dt
  enemyTimer = enemyTimer + dt

  -- Movement
  if lkid("d") then
    spaceship.x = spaceship.x + spaceship.moveSpeed * dt
  elseif lkid("a") then
    spaceship.x = spaceship.x - spaceship.moveSpeed * dt
  end
  if lkid("w") then
    spaceship.y = spaceship.y - spaceship.moveSpeed * dt
  elseif lkid("s") then
    spaceship.y = spaceship.y + spaceship.moveSpeed * dt
  end

  -- Fire
  if lkid("space") then
    if spaceship.bulletShootingTime > spaceship.bulletShootingRate then
      bulletSpawn()
      spaceship.bulletShootingTime = 0
    end
  end

  -- Bullet update
  for i,v in ipairs(spaceship.bullets) do
    v.y = v.y - dt * v.bulletSpeed
  end

  -- Enemies
  if enemyTimer >= enemySpawnRate then
    enemySpawn()
    enemyTimer = 0
  end

  -- Enemy update
  for i,v in ipairs(enemies) do
    v.y = v.y + dt * v.enemySpeed
  end

  -- Collision
  for i,v in ipairs(enemies) do
    for j,k in ipairs(spaceship.bullets) do
      if checkCollision(v, k) == true then
        table.remove(enemies, i)
        table.remove(spaceship.bullets, j)
      end
    end
  end

  Background:update(dt)

end

function love.draw()

  -- Background
  Background:draw()

  -- Spaceship
  lg.draw(spaceshipDefault, spaceship.x, spaceship.y, 0, 3, 3)
  
  -- Bullets
  for i,v in ipairs(spaceship.bullets) do
    lg.draw(bullet, v.x, v.y, 0, 2, 2)
  end

  -- Enemies
  for i,v in ipairs(enemies) do
    lg.draw(enemy, v.x, v.y, 0, 3, 3)
  end

  -- Show FPS
  displayFps()

end

function bulletSpawn()

  table.insert(spaceship.bullets, {
    x = spaceship.x + 21,
    y = spaceship.y - 4,
    w = 6,
    h = 6,
    bulletSpeed = spaceship.bulletSpeed
  })

end

function enemySpawn()

  table.insert(enemies, {
    x = math.random(24, lg.getWidth() - 72),
    y = -48,
    w = 48,
    h = 48,
    enemySpeed = enemySpeed
  })

end

function checkCollision(a, b)
  if a.x + a.w > b.x and a.x < b.x + b.w and a.y + a.h > b.y and a.y < b.y + b.h then
    return true
  else
    return false
  end
end

function displayFps()

  local font = lg.newFont(36)
  lg.setFont(font)
  lg.print('FPS: '..tostring(love.timer.getFPS()), 5, 5)

end