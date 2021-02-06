# print 5 random numbers between 0 and 99 using a while loop
numbers = []

while numbers.length < 5
  random_number = rand(0..99)
  numbers << random_number
  puts random_number
end