# print number is odd (or even if even)!
#   for number = 1-5

count = 0
loop do
  count += 1
  puts "#{count} is " + "#{count.even? ? "even" : "odd"}"
  break if count == 5
end