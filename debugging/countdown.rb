# Problem:
# fix the countdown code below, so that it actually counts down from 10 to 1
#def decrease(counter)
#  counter -= 1
#end

counter = 10

10.times do
  puts counter
  counter -= 1
  #decrease(counter)
end

puts 'LAUNCH!'

# Further exploration:
# only specify 10 once
counter = 10

counter.times do
  puts counter
  counter -= 1
  #decrease(counter)
end

puts 'LAUNCH!'
