# puts "the value of 40 + 2 is " + (40 + 2)
# the above code returns an error. why? what are 2 ways to fix this?

# there error is b/c you can't print a string and an integer together without converting one to the other 

# fix 1:
puts "the value of 40 + 2 is " + (40 + 2).to_s

# fix 2:
puts "the value of 40 + 2 is #{40 + 2}"
