print("Another Lua file :>")

computer = {}
computer.procesor = "i5"
computer.color = "silver"
computer.ram = 8

print("My computer is " .. computer.color)

fruits = {
  apple = 1,
  banana = 2,
  strawberry = 4,
  pear = 8,
  grape = 16,
  nut = 32
}

print(fruits.grape)

money = 99
if money > 109 then
  print("buy it")
else
  print("i need more money")
end

function greet(name)
  return "Hello "..name.."!"
end

print(greet("Martha"))

counter = 0
while counter < 3 do
  print("Loop")
  counter = counter + 1
end

--[[counter = 0
repeat
  print("Repeat")
  counter = counter + 1
until counter == 3]]--

l = {'Lua', 'Löve'}
for iterator = 1, 2 do
  print(l[iterator])
end