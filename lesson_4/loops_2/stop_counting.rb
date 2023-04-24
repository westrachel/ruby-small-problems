# modify block so that it prints the current number and stops iterating when current number == 2

5.times do |index|
  puts index 
  break if index == 2
end

# follow-up q: how many values should print if were to run the following?
# the following should print 5 values (0 - 4 b/c index starts at 0)
# 5.times do |index|
#   puts index
#   break if index > 7
# end

# follow-up q: how many values should print if were to run the following?
# the following should print 1 value, 0, and then break b/c the index < 7
# 5.times do |index|
#   puts index
#   break if index < 7
# end