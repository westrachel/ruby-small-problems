# modify code, so that loop iterates until either number_a or number_b equals 5
# print "5 was reached!" before breaking out of the loop
# use next keyword to skip over the break if neither a or b == 5

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next if number_a != 5 && number_b != 5
  break puts "5 was reached"
end