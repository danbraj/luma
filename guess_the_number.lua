math.randomseed(os.time())

local lives = 10
local number = math.random(1, 100)

print("Welcome to `Guess the Number` game. What is this number?")

while lives > 0 do

  print("You have "..lives.." left, guess the number.")
  local answer = io.read()
  answer = tonumber(answer)

  if answer > number then
    print("Too higher number...")
  elseif answer < number then
    print("Too lower number...")
  else
    print("Congratulations!")
    break
  end

  lives = lives - 1

  if lives <= 0 then
    print("Mission failed!")
    break
  end

end