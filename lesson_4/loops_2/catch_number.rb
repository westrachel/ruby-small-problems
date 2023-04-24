# make loop stop if number is between [0, 10]
loop do
  number = rand(100)
  puts number
  break if (0..10).include?(number)
end